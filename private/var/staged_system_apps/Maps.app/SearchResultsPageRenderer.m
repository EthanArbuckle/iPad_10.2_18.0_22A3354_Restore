@implementation SearchResultsPageRenderer

- (SearchResultsPageRenderer)initWithSearchResults:(id)a3 title:(id)a4 subTitle:(id)a5 mapView:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SearchResultsPageRenderer *v15;
  SearchResultsPageRenderer *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SearchResultsPageRenderer;
  v15 = -[MapCachedPageRenderer init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_searchResults, a3);
    -[MapPageRenderer setTitle:](v16, "setTitle:", v12);
    -[MapPageRenderer setSubTitle:](v16, "setSubTitle:", v13);
    -[MapPageRenderer setMapView:](v16, "setMapView:", v14);
  }

  return v16;
}

- (id)computeCurrentPrintInfo
{
  uint64_t v3;
  MapsSearchPrintingInfo *v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  CGFloat MinY;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double MinX;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v38;
  CGFloat rect;
  unint64_t v40;
  id obja;
  NSArray *obj;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v3 = -[SearchResultsPageRenderer searchResultsPerPage](self, "searchResultsPerPage");
  if ((unint64_t)v3 >= 2)
  {
    v38 = v3;
    v40 = vcvtps_s32_f32((float)-[NSArray count](self->_searchResults, "count") / (float)v3);
    v43 = objc_alloc_init((Class)NSMutableArray);
    -[SearchResultsPageRenderer paperRect](self, "paperRect");
    v6 = v5;
    obja = v7;
    rect = v8;
    v10 = v9;
    -[SearchResultsPageRenderer overviewRect](self, "overviewRect");
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
    v15 = CGRectGetMaxX(v49) + 41.0;
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    MinY = CGRectGetMinY(v50);
    v51.origin.x = v6;
    *(_QWORD *)&v51.origin.y = obja;
    v51.size.width = rect;
    v51.size.height = v10;
    v17 = CGRectGetMaxX(v51) - v15 + -63.0;
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    v18 = CGRectGetHeight(v52);
    v53.origin.x = v15;
    v53.origin.y = MinY;
    v53.size.width = v17;
    v53.size.height = v18;
    v19 = CGRectGetHeight(v53);
    v54.origin.x = v15;
    v54.origin.y = MinY;
    v54.size.width = v17;
    v54.size.height = v18;
    v20 = CGRectGetWidth(v54);
    v55.origin.x = v15;
    v55.origin.y = MinY;
    v55.size.width = v17;
    v55.size.height = v18;
    MinX = CGRectGetMinX(v55);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = self->_searchResults;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v45;
      v25 = 1;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v24)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapPageRenderer mapView](self, "mapView"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResultCell cellWithSearchResult:order:mapType:](SearchResultCell, "cellWithSearchResult:order:mapType:", v27, (char *)i + v25, objc_msgSend(v28, "mapType")));

          objc_msgSend(v29, "setFrame:", MinX, 0.0, v20, 81.5);
          objc_msgSend(v43, "addObject:", v29);

        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        v25 += (uint64_t)i;
      }
      while (v23);
    }

    v30 = objc_msgSend(v43, "count");
    v56.origin.x = v15;
    v56.origin.y = MinY;
    v56.size.width = v17;
    v56.size.height = v18;
    v31 = CGRectGetMinY(v56);
    if (v30)
    {
      v32 = v31;
      v33 = 0;
      v34 = 0;
      v35 = (v19 + (double)v38 * -81.5) / (double)(v38 - 1) + 81.5;
      do
      {
        v36 = v34;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", v33));

        objc_msgSend(v34, "setY:", v32);
        objc_msgSend(v34, "setPage:", v33 / v38);
        v32 = v35 + v32;
        v57.origin.x = v15;
        v57.origin.y = MinY;
        v57.size.width = v17;
        v57.size.height = v18;
        if (v32 >= CGRectGetMaxY(v57))
        {
          v58.origin.x = v15;
          v58.origin.y = MinY;
          v58.size.width = v17;
          v58.size.height = v18;
          v32 = CGRectGetMinY(v58);
        }
        ++v33;
      }
      while (v30 != (id)v33);

    }
    v4 = -[MapsSearchPrintingInfo initWithNumberOfPages:searchResultCells:]([MapsSearchPrintingInfo alloc], "initWithNumberOfPages:searchResultCells:", v40, v43);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)numberOfPages
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapCachedPageRenderer currentPrintInfo](self, "currentPrintInfo"));
  v3 = objc_msgSend(v2, "numberOfPages");

  return (int64_t)v3;
}

- (CGRect)overviewRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat r2;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v24;

  -[SearchResultsPageRenderer paperRect](self, "paperRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SearchResultsPageRenderer printableRect](self, "printableRect");
  r2 = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v18 = CGRectGetWidth(v20) * 0.5 + -63.0 + -20.0;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v22.size.height = CGRectGetHeight(v21) + -76.5 + -69.5;
  v22.origin.x = 63.0;
  v22.origin.y = 76.5;
  v22.size.width = v18;
  v24.origin.x = r2;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  return CGRectIntersection(v22, v24);
}

- (void)prepareForDrawingPages:(_NSRange)a3
{
  void *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  NSUInteger v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CLLocationCoordinate2D v25;
  MKMapRect v26;
  MKCoordinateRegion v27;

  v4 = malloc_type_malloc(16 * -[NSArray count](self->_searchResults, "count", a3.location, a3.length), 0x1000040451B5BE8uLL);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_searchResults;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      v11 = (uint64_t)v4 + 16 * v8 + 8;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10), "coordinate", (_QWORD)v20);
        *(MKMapPoint *)(v11 - 8) = MKMapPointForCoordinate(v25);
        v10 = (char *)v10 + 1;
        v11 += 16;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v8 += (uint64_t)v10;
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v26.origin.x = MKMapRectBoundingMapPoints(v4, v8);
  v27 = MKCoordinateRegionForMapRect(v26);
  latitude = v27.center.latitude;
  longitude = v27.center.longitude;
  latitudeDelta = v27.span.latitudeDelta;
  longitudeDelta = v27.span.longitudeDelta;
  self->super.super._centerCoordinate.latitude = v27.center.latitude;
  self->super.super._centerCoordinate.longitude = v27.center.longitude;
  v16 = -[NSArray count](self->_searchResults, "count");
  v17 = -1.0;
  if (v16 == 1)
  {
    -[MKMapView _zoomLevel](self->super.super._mapView, "_zoomLevel");
    v17 = floor(v18) + -1.0;
  }
  -[SearchResultsPageRenderer _zoomLevelForCoordinateRegion:clampTo:](self, "_zoomLevelForCoordinateRegion:clampTo:", latitude, longitude, latitudeDelta, longitudeDelta, v17, (_QWORD)v20);
  self->super.super._zoomLevel = v19;
  free(v4);
}

- (int64_t)searchResultsPerPage
{
  CGRect v3;

  -[SearchResultsPageRenderer overviewRect](self, "overviewRect");
  return vcvtmd_s64_f64(CGRectGetHeight(v3) / 86.5);
}

- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  objc_super v4;

  self->super.super._topContentIconType = 7;
  v4.receiver = self;
  v4.super_class = (Class)SearchResultsPageRenderer;
  -[MapPageRenderer drawTopContentInRect:forPageAtIndex:](&v4, "drawTopContentInRect:forPageAtIndex:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_drawPinsInRect:(CGRect)a3 zoomLevel:(double)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  CGFloat v16;
  double x;
  CGFloat v18;
  double y;
  CGFloat MinY;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  __int128 v38;
  id obja[2];
  void *obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  _BYTE v50[128];
  CGRect v51;
  CGRect v52;

  v6 = -[SearchResultsPageRenderer overviewRect](self, "overviewRect", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = MKZoomScaleForZoomLevelF(v6, v15, a4);
  *(_OWORD *)obja = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v49.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v49.c = *(_OWORD *)obja;
  *(_OWORD *)&v49.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v38 = *(_OWORD *)&v49.tx;
  x = self->_topLeftCorner.x;
  v51.origin.x = v8;
  v51.origin.y = v10;
  v51.size.width = v12;
  v51.size.height = v14;
  v18 = CGRectGetMinX(v51) - x;
  y = self->_topLeftCorner.y;
  v52.origin.x = v8;
  v52.origin.y = v10;
  v52.size.width = v12;
  v52.size.height = v14;
  MinY = CGRectGetMinY(v52);
  *(_OWORD *)&v48.a = *(_OWORD *)&v49.a;
  *(_OWORD *)&v48.c = *(_OWORD *)obja;
  *(_OWORD *)&v48.tx = *(_OWORD *)&v49.tx;
  CGAffineTransformTranslate(&v49, &v48, v18, MinY - y);
  v47 = v49;
  CGAffineTransformScale(&v48, &v47, v16, v16);
  v49 = v48;
  -[UIColor set](self->super.super._calloutTextColor, "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapCachedPageRenderer currentPrintInfo](self, "currentPrintInfo"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchResultCells"));

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1003CB9E0;
  v45[3] = &unk_1011B44D8;
  v46 = v49;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sortedArrayUsingComparator:", v45));
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v48 = v49;
        objc_msgSend(v27, "transformedPoint:", &v48, v38);
        v29 = v28;
        v31 = v30;
        +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", 6, v28 + -17.0000005, v30 + -35.0, 34.000001, 40.0);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v27, "order")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v32, 0));

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 9.0));
        objc_msgSend(v33, "_maps_sizeWithFont:", v34);
        v36 = v35;

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 9.0));
        objc_msgSend(v33, "_maps_drawAtPoint:withFont:", v37, v29 + v36 * -0.5, v31 + -26.0);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v24);
  }

}

- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  MapScaleCell *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  void *v39;
  SearchResultsPageRenderer *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v10, "addObject:", self);
  v40 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapCachedPageRenderer currentPrintInfo](self, "currentPrintInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchResultCells"));

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v18, "page") == (id)a3)
          objc_msgSend(v10, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v15);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  objc_msgSend(v19, "_enableManualPrintPage:", 1);

  while (objc_msgSend(v10, "count"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "snapshotBlock"));
    v22 = (void *)v21;
    if (v21)
    {
      (*(void (**)(uint64_t))(v21 + 16))(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      if ((objc_msgSend(v20, "hasSnapshot") & 1) == 0)
      {
        do
        {
          v24 = objc_autoreleasePoolPush();
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
          objc_msgSend(v25, "runUntilDate:", v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v27, "timeIntervalSinceDate:", v23);
          v29 = v28;

          objc_autoreleasePoolPop(v24);
        }
        while ((objc_msgSend(v20, "hasSnapshot") & 1) == 0 && v29 <= 30.0);
      }

    }
    objc_msgSend(v20, "releaseSnapshotCreator");
    objc_msgSend(v10, "removeObjectAtIndex:", 0);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "printPageRenderer"));

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
    objc_msgSend(v32, "_enableManualPrintPage:", 0);

    -[MapPageRenderer drawOverview](v40, "drawOverview");
    v33 = -[MapScaleCell initWithDistanceInMeters:]([MapScaleCell alloc], "initWithDistanceInMeters:", MKMetersBetweenMapPoints((MKMapPoint)v40->_mlMapPoint, (MKMapPoint)v40->_mrMapPoint));
    -[SearchResultsPageRenderer overviewRect](v40, "overviewRect");
    -[MapScaleCell drawInRect:](v33, "drawInRect:");
    -[SearchResultsPageRenderer _drawPinsInRect:zoomLevel:](v40, "_drawPinsInRect:zoomLevel:", x, y, width, height, v40->super.super._zoomLevel);
    -[SearchResultsPageRenderer drawTopContentInRect:forPageAtIndex:](v40, "drawTopContentInRect:forPageAtIndex:", a3, x, y, width, height);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v34 = v13;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(_QWORD *)v42 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v39, "page") == (id)a3)
            objc_msgSend(v39, "drawInRect:", x, y, width, height);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v36);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
}

- (double)_zoomLevelForCoordinateRegion:(id *)a3 clampTo:(double)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
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
  double v34;
  double v35;
  double v36;
  double v38;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CLLocationDegrees coordinate;
  double coordinate_8;
  CLLocationDegrees v48;
  CLLocationCoordinate2D v49;
  CLLocationCoordinate2D v50;

  v8 = v7;
  v43 = v5;
  v44 = v6;
  v9 = v4;
  v12 = -[SearchResultsPageRenderer overviewRect](self, "overviewRect", a3);
  v14 = v13 * 0.5;
  v16 = v15 * 0.5;
  if (v8 <= 0.0)
    v17 = 18;
  else
    v17 = (uint64_t)v8;
  if (v8 <= 0.0)
    v18 = 3;
  else
    v18 = (uint64_t)(v8 + -1.0);
  v19 = (double)v17;
  v41 = a4;
  v42 = v9;
  v20 = ((uint64_t (*)(id, double, double, double))MKTilePointForCoordinate)(v12, a4, v9, (double)v17);
  if (v17 <= v18)
  {
    v38 = v21 - v14;
    v35 = v22 - v16;
  }
  else
  {
    while (1)
    {
      v19 = (double)v17;
      v23 = MKTilePointForCoordinate(v20, v41, v42, (double)v17);
      v25 = v24;
      v26 = v23 - v14;
      v27 = v14;
      v28 = v14 + v23;
      v29 = v24 - v16;
      v30 = v16;
      v45 = v16 + v24;
      v40 = v26;
      coordinate = ((double (*)(void))MKCoordinateForTilePoint)();
      v32 = v31;
      v48 = MKCoordinateForTilePoint(v28, v25, (double)v17);
      v34 = v33;
      v35 = v29;
      coordinate_8 = MKCoordinateForTilePoint(v23, v29, (double)v17);
      v36 = MKCoordinateForTilePoint(v23, v45, (double)v17);
      v49.latitude = coordinate;
      v49.longitude = v32;
      self->_mlMapPoint = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapPointForCoordinate(v49);
      v50.latitude = v48;
      v50.longitude = v34;
      self->_mrMapPoint = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapPointForCoordinate(v50);
      if (coordinate_8 - v36 + 0.0001 >= v43 && v34 - v32 + 0.0001 >= v44)
        break;
      --v17;
      v14 = v27;
      v16 = v30;
      if (v17 <= v18)
      {
        v19 = (double)v18;
        break;
      }
    }
    v38 = v40;
  }
  self->_topLeftCorner.x = v38;
  self->_topLeftCorner.y = v35;
  return v19;
}

@end
