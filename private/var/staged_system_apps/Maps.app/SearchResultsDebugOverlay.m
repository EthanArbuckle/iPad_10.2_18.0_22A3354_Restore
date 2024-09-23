@implementation SearchResultsDebugOverlay

- (SearchResultsDebugOverlay)initWithMapView:(id)a3
{
  id v5;
  SearchResultsDebugOverlay *v6;
  SearchResultsDebugOverlay *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchResultsDebugOverlay;
  v6 = -[SearchResultsDebugOverlay init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapView, a3);

  return v7;
}

- (void)drawDebugMapRegionsWithSearchResults:(id)a3 suggestedMapRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay polygons](self, "polygons"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
    -[SearchResultsDebugOverlay removeDrawnDebugMapRegions](self, "removeDrawnDebugMapRegions");
  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v6, "count") + 1);
  -[SearchResultsDebugOverlay setPolygons:](self, "setPolygons:", v10);

  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay polygonForMapRegion:title:](self, "polygonForMapRegion:title:", v7, CFSTR("searchResultsRegion")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
    objc_msgSend(v11, "setStrokeColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay polygons](self, "polygons"));
    objc_msgSend(v13, "addObject:", v11);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mapItem", (_QWORD)v29));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_displayMapRegion"));

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay polygonForMapRegion:title:](self, "polygonForMapRegion:title:", v21, v22));

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay polygons](self, "polygons"));
          objc_msgSend(v24, "addObject:", v23);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay mapView](self, "mapView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay polygons](self, "polygons"));
  objc_msgSend(v25, "addOverlays:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay mapView](self, "mapView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay polygons](self, "polygons"));
  objc_msgSend(v27, "addAnnotations:", v28);

}

- (void)removeDrawnDebugMapRegions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay mapView](self, "mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay polygons](self, "polygons"));
  objc_msgSend(v3, "removeOverlays:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay mapView](self, "mapView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay polygons](self, "polygons"));
  objc_msgSend(v5, "removeAnnotations:", v6);

  -[SearchResultsDebugOverlay setPolygons:](self, "setPolygons:", 0);
}

- (id)polygonForMapRegion:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  double v8;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  MKMapPoint v11;
  double v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  MKMapPoint v15;
  double v16;
  CLLocationDegrees v17;
  CLLocationDegrees v18;
  MKMapPoint v19;
  double v20;
  CLLocationDegrees v21;
  CLLocationDegrees v22;
  void *v23;
  void *v24;
  MKMapPoint v26[4];
  CLLocationCoordinate2D v27;
  CLLocationCoordinate2D v28;
  CLLocationCoordinate2D v29;
  CLLocationCoordinate2D v30;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "northLat");
  v9 = v8;
  objc_msgSend(v7, "westLng");
  v27 = CLLocationCoordinate2DMake(v9, v10);
  v11 = MKMapPointForCoordinate(v27);
  objc_msgSend(v7, "northLat");
  v13 = v12;
  objc_msgSend(v7, "eastLng");
  v28 = CLLocationCoordinate2DMake(v13, v14);
  v15 = MKMapPointForCoordinate(v28);
  objc_msgSend(v7, "southLat");
  v17 = v16;
  objc_msgSend(v7, "eastLng");
  v29 = CLLocationCoordinate2DMake(v17, v18);
  v19 = MKMapPointForCoordinate(v29);
  objc_msgSend(v7, "southLat");
  v21 = v20;
  objc_msgSend(v7, "westLng");
  v30 = CLLocationCoordinate2DMake(v21, v22);
  v26[0] = v11;
  v26[1] = v15;
  v26[2] = v19;
  v26[3] = MKMapPointForCoordinate(v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResultDebugPolygon polygonWithPoints:count:](SearchResultDebugPolygon, "polygonWithPoints:count:", v26, 4));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDebugOverlay annotationTitleWithMapRegion:title:](self, "annotationTitleWithMapRegion:title:", v7, v6));

  objc_msgSend(v23, "setTitle:", v24);
  return v23;
}

- (id)annotationTitleWithMapRegion:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "eastLng");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("eastLng : %f"), v7));
  objc_msgSend(v6, "westLng");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("westLng : %f"), v9));
  objc_msgSend(v6, "northLat");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("northLat : %f"), v11));
  objc_msgSend(v6, "southLat");
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("southLat : %f"), v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@ %@ %@ %@}"), v8, v10, v12, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v5, v16));

  return v17;
}

+ (id)rendererWithPolygon:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)MKPolygonRenderer), "initWithPolygon:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "strokeColor"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.800000012));
  objc_msgSend(v4, "setStrokeColor:", v6);

  objc_msgSend(v4, "setLineWidth:", 1.0);
  return v4;
}

+ (id)viewForAnnotation:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)MKAnnotationView), "initWithAnnotation:reuseIdentifier:", v3, CFSTR("polygonAnnotation"));

  return v4;
}

- (NSMutableArray)polygons
{
  return self->_polygons;
}

- (void)setPolygons:(id)a3
{
  objc_storeStrong((id *)&self->_polygons, a3);
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
  objc_storeStrong((id *)&self->_polygons, 0);
}

@end
