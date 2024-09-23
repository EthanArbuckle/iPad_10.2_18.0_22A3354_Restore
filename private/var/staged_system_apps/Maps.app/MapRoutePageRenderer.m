@implementation MapRoutePageRenderer

- (MapRoutePageRenderer)initWithRoute:(id)a3 mapView:(id)a4
{
  id v7;
  id v8;
  MapRoutePageRenderer *v9;
  MapRoutePageRenderer *v10;
  UIColor *v11;
  UIColor *routeCenterPrintColor;
  NSMutableArray *v13;
  NSMutableArray *snapshotObjects;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MapRoutePageRenderer;
  v9 = -[MapCachedPageRenderer init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_route, a3);
    -[MapPageRenderer setMapView:](v10, "setMapView:", v8);
    v11 = (UIColor *)objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.278431373, 0.560784314, 1.0, 1.0);
    routeCenterPrintColor = v10->_routeCenterPrintColor;
    v10->_routeCenterPrintColor = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    snapshotObjects = v10->_snapshotObjects;
    v10->_snapshotObjects = v13;

  }
  return v10;
}

- (id)computeCurrentPrintInfo
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  CGFloat MinY;
  double v21;
  CGFloat v22;
  double v23;
  MapsRoutePrintingInfo *v24;
  unint64_t v25;
  double v26;
  double MinX;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  id v38;
  GEOComposedRoute *route;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  void *v48;
  CGFloat v50;
  unint64_t v51;
  CGFloat v52;
  uint64_t v53;
  id v54;
  float obj;
  id obja;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self->_route, "steps"));
  v4 = objc_msgSend(v3, "count");

  if (-[GEOComposedRoute transportType](self->_route, "transportType") == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steppingSigns](self->_route, "steppingSigns"));
    v4 = objc_msgSend(v5, "count");

  }
  v6 = -[MapRoutePageRenderer routeStepsPerPage](self, "routeStepsPerPage");
  if (v6)
  {
    v7 = v6;
    obj = (float)(unint64_t)v4 / (float)v6;
    v8 = objc_alloc_init((Class)NSMutableArray);
    v54 = objc_alloc_init((Class)NSMutableArray);
    -[MapRoutePageRenderer printableRect](self, "printableRect");
    v10 = v9;
    v50 = v12;
    v52 = v11;
    v14 = v13;
    -[MapRoutePageRenderer overviewRect](self, "overviewRect");
    x = v67.origin.x;
    y = v67.origin.y;
    width = v67.size.width;
    height = v67.size.height;
    v19 = CGRectGetMaxX(v67) + 40.0;
    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = height;
    MinY = CGRectGetMinY(v68);
    v69.origin.x = v10;
    v69.size.width = v50;
    v69.origin.y = v52;
    v69.size.height = v14;
    v21 = CGRectGetMaxX(v69) - v19 + -63.0;
    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    v22 = CGRectGetHeight(v70);
    if (v7 >= 2)
    {
      v71.origin.x = v19;
      v71.origin.y = MinY;
      v71.size.width = v21;
      v71.size.height = v22;
      v23 = (CGRectGetHeight(v71) - (double)v7 * 81.5) / (double)(v7 - 1) + 81.5;
    }
    else
    {
      v23 = 81.5;
    }
    v25 = vcvtps_s32_f32(obj);
    v72.origin.x = v19;
    v72.origin.y = MinY;
    v72.size.width = v21;
    v72.size.height = v22;
    v26 = CGRectGetWidth(v72);
    v73.origin.x = v19;
    v73.origin.y = MinY;
    v73.size.width = v21;
    v73.size.height = v22;
    MinX = CGRectGetMinX(v73);
    if (-[GEOComposedRoute transportType](self->_route, "transportType") == 1)
    {
      v63 = 0uLL;
      v64 = 0uLL;
      v61 = 0uLL;
      v62 = 0uLL;
      obja = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steppingSigns](self->_route, "steppingSigns"));
      v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(_QWORD *)v62 != v30)
              objc_enumerationMutation(obja);
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[TransitRouteStepCell cellWithRoute:sign:](TransitRouteStepCell, "cellWithRoute:sign:", self->_route, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i)));
            objc_msgSend(v32, "setFrame:", MinX, 0.0, v26, 81.5);
            objc_msgSend(v8, "addObject:", v32);

          }
          v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        }
        while (v29);
      }
    }
    else
    {
      v59 = 0uLL;
      v60 = 0uLL;
      v57 = 0uLL;
      v58 = 0uLL;
      obja = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self->_route, "steps"));
      v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (v33)
      {
        v34 = v33;
        v51 = v25;
        v53 = v7;
        v35 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            v37 = v8;
            if (*(_QWORD *)v58 != v35)
              objc_enumerationMutation(obja);
            v38 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j), "stepIndex", v51, v53);
            route = self->_route;
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[MapPageRenderer mapView](self, "mapView"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[RouteStepCell cellWithRoute:stepIndex:mapType:](RouteStepCell, "cellWithRoute:stepIndex:mapType:", route, v38, objc_msgSend(v40, "mapType")));

            objc_msgSend(v41, "setFrame:", MinX, 0.0, v26, 81.5);
            v8 = v37;
            objc_msgSend(v37, "addObject:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[RouteStepCalloutCell cellWithRoute:stepIndex:type:](RouteStepCalloutCell, "cellWithRoute:stepIndex:type:", self->_route, v38, 0));
            objc_msgSend(v54, "addObject:", v42);

          }
          v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        }
        while (v34);
        v25 = v51;
        v7 = v53;
      }
    }

    v43 = objc_msgSend(v8, "count");
    v74.origin.x = v19;
    v74.origin.y = MinY;
    v74.size.width = v21;
    v74.size.height = v22;
    v44 = CGRectGetMinY(v74);
    if (v43)
    {
      v45 = v44;
      v46 = 0;
      v47 = 0;
      do
      {
        v48 = v47;
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v46));

        objc_msgSend(v47, "setY:", v45);
        objc_msgSend(v47, "setPage:", v46 / v7);
        v45 = v23 + v45;
        v75.origin.x = v19;
        v75.origin.y = MinY;
        v75.size.width = v21;
        v75.size.height = v22;
        if (v45 >= CGRectGetMaxY(v75))
        {
          v76.origin.x = v19;
          v76.origin.y = MinY;
          v76.size.width = v21;
          v76.size.height = v22;
          v45 = CGRectGetMinY(v76);
        }
        ++v46;
      }
      while (v43 != (id)v46);

    }
    v24 = -[MapsRoutePrintingInfo initWithNumberOfPages:routeStepCells:routeStepCalloutCells:]([MapsRoutePrintingInfo alloc], "initWithNumberOfPages:routeStepCells:routeStepCalloutCells:", v25, v8, v54);

  }
  else
  {
    v24 = 0;
  }
  return v24;
}

- (int64_t)numberOfPages
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapCachedPageRenderer currentPrintInfo](self, "currentPrintInfo"));
  v3 = objc_msgSend(v2, "numberOfPages");

  return (int64_t)v3;
}

- (void)prepareForDrawingPages:(_NSRange)a3
{
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  double v6;
  MKMapRect v7;
  MKCoordinateRegion v8;

  -[GEOComposedRoute _maps_boundingMapRect](self->_route, "_maps_boundingMapRect", a3.location, a3.length);
  v8 = MKCoordinateRegionForMapRect(v7);
  latitude = v8.center.latitude;
  longitude = v8.center.longitude;
  -[MapRoutePageRenderer _zoomLevelForCoordinateRegion:](self, "_zoomLevelForCoordinateRegion:");
  self->super.super._zoomLevel = v6;
  self->super.super._centerCoordinate.latitude = latitude;
  self->super.super._centerCoordinate.longitude = longitude;
}

- (int64_t)routeStepsPerPage
{
  CGRect v3;

  -[MapRoutePageRenderer overviewRect](self, "overviewRect");
  return vcvtmd_s64_f64(CGRectGetHeight(v3) / 86.5);
}

- (CGRect)overviewRect
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double x;
  double y;
  double width;
  double height;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double MaxY;
  CGFloat r1;
  CGFloat v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;
  CGRect v32;

  -[MapRoutePageRenderer paperRect](self, "paperRect");
  v6 = v5;
  v8 = v7;
  if (v3 * v4 >= 2.22044605e-16)
  {
    v13 = v3;
    v14 = v4;
    -[MapRoutePageRenderer printableRect](self, "printableRect", v3 * v4);
    v25 = v15;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v13;
    v26.size.height = v14;
    r1 = CGRectGetWidth(v26) * 0.5 + -63.0 + -20.0;
    v27.origin.x = v6;
    v27.origin.y = v8;
    v27.size.width = v13;
    v27.size.height = v14;
    v22 = CGRectGetHeight(v27) + -76.5 + -69.5;
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.width = v13;
    v28.size.height = v14;
    MaxY = CGRectGetMaxY(v28);
    v29.origin.x = v25;
    v29.origin.y = v17;
    v29.size.width = v19;
    v29.size.height = v21;
    v30.size.height = v22 + CGRectGetMaxY(v29) - MaxY;
    v30.origin.x = 63.0;
    v30.origin.y = 76.5;
    v30.size.width = r1;
    v32.origin.x = v25;
    v32.origin.y = v17;
    v32.size.width = v19;
    v32.size.height = v21;
    *(CGRect *)&x = CGRectIntersection(v30, v32);
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGAffineTransform)_overviewAffineTransformForRect:(SEL)a3 zoomLevel:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double *v9;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat MinY;
  __int128 v16;
  CGAffineTransform *result;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = (double *)self;
  v11 = MKZoomScaleForZoomLevelF(self, a3, a5);
  v20 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v21 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v21;
  v19 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v19;
  v9 += 14;
  v12 = *v9;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v13 = CGRectGetMinX(v24) - v12;
  v14 = v9[1];
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinY = CGRectGetMinY(v25);
  *(_OWORD *)&v23.a = v20;
  *(_OWORD *)&v23.c = v21;
  *(_OWORD *)&v23.tx = v19;
  CGAffineTransformTranslate(retstr, &v23, v13, MinY - v14);
  v16 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v22.c = v16;
  *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v23, &v22, v11, v11);
  v18 = *(_OWORD *)&v23.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v23.a;
  *(_OWORD *)&retstr->c = v18;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v23.tx;
  return result;
}

- (void)_drawRouteLineInRect:(CGRect)a3 zoomLevel:(double)a4 transform:(CGAffineTransform *)a5
{
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  CGContext *CurrentContext;
  CGPath *Mutable;
  uint64_t v22;
  unint64_t i;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  char *v28;
  unint64_t v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  CGRect v39;

  -[MapRoutePageRenderer overviewRect](self, "overviewRect", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v29 = 0;
  v30 = 0;
  v16 = -[GEOComposedRoute _maps_getMapPoints:count:](self->_route, "_maps_getMapPoints:count:", &v30, &v29);
  if (v29)
    goto LABEL_2;
  v24 = sub_1004318FC();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v32 = "-[MapRoutePageRenderer _drawRouteLineInRect:zoomLevel:transform:]";
    v33 = 2080;
    v34 = "MapRoutePageRenderer.m";
    v35 = 1024;
    v36 = 191;
    v37 = 2080;
    v38 = "count > 0";
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
  }

  v16 = sub_100A70734();
  if ((_DWORD)v16)
  {
    v26 = sub_1004318FC();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v32 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  if (v29)
  {
LABEL_2:
    v18 = MKZoomScaleForZoomLevelF(v16, v17, a4);
    v19 = v18 * MKRoadWidthAtZoomScale(v18);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v39.origin.x = v9;
    v39.origin.y = v11;
    v39.size.width = v13;
    v39.size.height = v15;
    CGContextClipToRect(CurrentContext, v39);
    CGContextSetLineCap(CurrentContext, kCGLineCapRound);
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, a5, *(CGFloat *)v30, *((CGFloat *)v30 + 1));
    if (v29 >= 2)
    {
      v22 = 0;
      for (i = 1; i < v29; ++i)
      {
        CGPathAddLineToPoint(Mutable, a5, *(CGFloat *)((char *)v30 + v22 + 16), *(CGFloat *)((char *)v30 + v22 + 24));
        v22 += 16;
      }
    }
    free(v30);
    CGContextSaveGState(CurrentContext);
    CGContextBeginPath(CurrentContext);
    CGContextAddPath(CurrentContext, Mutable);
    CGContextSetLineWidth(CurrentContext, v19 + -1.0);
    CGContextSetStrokeColorWithColor(CurrentContext, -[UIColor CGColor](self->_routeCenterPrintColor, "CGColor"));
    CGContextStrokePath(CurrentContext);
    CGContextRestoreGState(CurrentContext);
    CGPathRelease(Mutable);
    CGContextRestoreGState(CurrentContext);
  }
}

- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[GEOComposedRoute transportType](self->_route, "transportType");
  if (v10 <= 3)
    self->super.super._topContentIconType = dword_100E36F90[v10];
  if (-[GEOComposedRoute transportType](self->_route, "transportType") == 1)
  {
    -[MapPageRenderer setSubTitle:](self, "setSubTitle:", 0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute expandedDistance](self->_route, "expandedDistance"));
    -[MapPageRenderer setTitle:](self, "setTitle:", v11);

    -[MapPageRenderer setSubTitle:](self, "setSubTitle:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute expandedTravelTime](self->_route, "expandedTravelTime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v12));
    -[MapPageRenderer setSubTitle:](self, "setSubTitle:", v13);

  }
  v14.receiver = self;
  v14.super_class = (Class)MapRoutePageRenderer;
  -[MapPageRenderer drawTopContentInRect:forPageAtIndex:](&v14, "drawTopContentInRect:forPageAtIndex:", a4, x, y, width, height);
}

- (void)_drawAddressWithPin:(unsigned int)a3 address:(id)a4 inRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  id v10;
  double MinX;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = *(_QWORD *)&a3;
  v10 = a4;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MinX = CGRectGetMinX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", v9, MinX, CGRectGetMinY(v15), 15.3000004, 18.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.400000006, 1.0));
  objc_msgSend(v12, "set");

  v13 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 9.0));
  objc_msgSend(v10, "_maps_drawInRect:withFont:", v13, x + 25.3000004, y, width + -25.3000004, height);

}

- (void)_drawBottomMarginContentInRect:(CGRect)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v8;
  double MinX;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  CGFloat v14;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[MapRoutePageRenderer overviewRect](self, "overviewRect", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  v8 = CGRectGetMaxY(v17) + 13.5;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MinX = CGRectGetMinX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v10 = CGRectGetWidth(v19) * 0.5 + -20.0;
  -[MapRoutePageRenderer printableRect](self, "printableRect");
  v11 = CGRectGetMaxY(v20) - v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute origin](self->_route, "origin"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navDisplayAddress"));
  -[MapRoutePageRenderer _drawAddressWithPin:address:inRect:](self, "_drawAddressWithPin:address:inRect:", 4, v13, MinX, v8, v10, v11);

  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v14 = CGRectGetMidX(v21) + -7.65000021 + 3.0;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self->_route, "destination"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navDisplayAddress"));
  -[MapRoutePageRenderer _drawAddressWithPin:address:inRect:](self, "_drawAddressWithPin:address:inRect:", 5, v15, v14, v8, v10, v11);

}

- (void)_layoutRouteStepCalloutAtIndex:(unint64_t)a3 depth:(int64_t)a4
{
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  id v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapCachedPageRenderer currentPrintInfo](self, "currentPrintInfo"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeStepCalloutCells"));

  v8 = objc_msgSend(v13, "count");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a3));
  if (a3 + 1 < (unint64_t)v8)
  {
    v10 = a3 - (_QWORD)v8;
    for (i = 1; v10 + i; ++i)
    {
      if (i)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a3 + i));
        if ((objc_msgSend(v12, "shouldRotateWithCallout:", v9) & 1) != 0
          || (objc_msgSend(v12, "shouldRotateWithCallout:", self->_redPinCallout) & 1) != 0
          || objc_msgSend(v12, "shouldRotateWithCallout:", self->_greenPinCallout))
        {
          if (objc_msgSend(v12, "rotate"))
          {
            if (a4 > 3
              || (-[MapRoutePageRenderer _layoutRouteStepCalloutAtIndex:depth:](self, "_layoutRouteStepCalloutAtIndex:depth:", a3 + i, a4 + 1), a4 >= 2))
            {

              break;
            }
          }
        }

      }
    }
  }

}

- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double zoomLevel;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *j;
  void *v47;
  MapScaleCell *v48;
  char *v49;
  char *v50;
  char *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *k;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _OWORD v68[3];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _OWORD v73[3];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[NSMutableArray addObject:](self->_snapshotObjects, "addObject:", self);
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapCachedPageRenderer currentPrintInfo](self, "currentPrintInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeStepCells"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v16, "page") == (id)a3)
          -[NSMutableArray addObject:](self->_snapshotObjects, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  objc_msgSend(v17, "_enableManualPrintPage:", 1);

  while (-[NSMutableArray count](self->_snapshotObjects, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_snapshotObjects, "objectAtIndexedSubscript:", 0));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "snapshotBlock"));
    v20 = (void *)v19;
    if (v19)
    {
      (*(void (**)(uint64_t))(v19 + 16))(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      if ((objc_msgSend(v18, "hasSnapshot") & 1) == 0)
      {
        do
        {
          v22 = objc_autoreleasePoolPush();
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
          objc_msgSend(v23, "runUntilDate:", v24);

          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v25, "timeIntervalSinceDate:", v21);
          v27 = v26;

          objc_autoreleasePoolPop(v22);
        }
        while ((objc_msgSend(v18, "hasSnapshot") & 1) == 0 && v27 <= 30.0);
      }

    }
    objc_msgSend(v18, "releaseSnapshotCreator");
    -[NSMutableArray removeObjectAtIndex:](self->_snapshotObjects, "removeObjectAtIndex:", 0);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "printPageRenderer"));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
    objc_msgSend(v30, "_enableManualPrintPage:", 0);

    -[MapPageRenderer drawOverview](self, "drawOverview");
    -[MapRoutePageRenderer overviewRect](self, "overviewRect");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v75 = 0u;
    v76 = 0u;
    v74 = 0u;
    -[MapRoutePageRenderer _overviewAffineTransformForRect:zoomLevel:](self, "_overviewAffineTransformForRect:zoomLevel:", v31);
    zoomLevel = self->super.super._zoomLevel;
    v73[0] = v74;
    v73[1] = v75;
    v73[2] = v76;
    -[MapRoutePageRenderer _drawRouteLineInRect:zoomLevel:transform:](self, "_drawRouteLineInRect:zoomLevel:transform:", v73, x, y, width, height, zoomLevel);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MapCachedPageRenderer currentPrintInfo](self, "currentPrintInfo"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "routeStepCalloutCells"));

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v42 = v41;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v44; j = (char *)j + 1)
        {
          if (*(_QWORD *)v70 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j);
          v68[0] = v74;
          v68[1] = v75;
          v68[2] = v76;
          objc_msgSend(v47, "setTransform:", v68);
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      }
      while (v44);
    }

    v48 = -[MapScaleCell initWithDistanceInMeters:]([MapScaleCell alloc], "initWithDistanceInMeters:", MKMetersBetweenMapPoints((MKMapPoint)self->mlMapPoint, (MKMapPoint)self->mrMapPoint));
    -[MapScaleCell drawInRect:](v48, "drawInRect:", v32, v34, v36, v38);
    -[MapRoutePageRenderer drawTopContentInRect:forPageAtIndex:](self, "drawTopContentInRect:forPageAtIndex:", a3, x, y, width, height);
    -[MapRoutePageRenderer _drawBottomMarginContentInRect:](self, "_drawBottomMarginContentInRect:", x, y, width, height);
    v49 = (char *)objc_msgSend(v42, "count");
    v50 = v49;
    if (!a3 && v49)
    {
      v51 = 0;
      do
        -[MapRoutePageRenderer _layoutRouteStepCalloutAtIndex:depth:](self, "_layoutRouteStepCalloutAtIndex:depth:", v51++, 1);
      while (v50 != v51);
    }
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapCachedPageRenderer currentPrintInfo](self, "currentPrintInfo", 0));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "routeStepCells"));

    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v55; k = (char *)k + 1)
        {
          if (*(_QWORD *)v65 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)k);
          if (objc_msgSend(v58, "page") == (id)a3)
            objc_msgSend(v58, "drawInRect:", x, y, width, height);
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
      }
      while (v55);
    }

    if (objc_msgSend(v42, "count"))
    {
      if ((unint64_t)(v50 - 1) >= 2)
      {
        v59 = 0;
        v60 = 2;
        do
        {
          v61 = v59;
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", v60 - 1));

          objc_msgSend(v59, "drawInRect:", x, y, width, height);
          ++v60;
        }
        while (v50 != (char *)v60);

      }
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v62, "drawInRect:", x, y, width, height);

      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lastObject"));
      objc_msgSend(v63, "drawInRect:", x, y, width, height);

    }
  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_snapshotObjects, 0);
  objc_storeStrong((id *)&self->_routeCenterPrintColor, 0);
  objc_storeStrong((id *)&self->_greenPinCallout, 0);
  objc_storeStrong((id *)&self->_redPinCallout, 0);
}

- (double)_zoomLevelForCoordinateRegion:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CLLocationDegrees v22;
  double v23;
  double v24;
  double v25;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CLLocationDegrees coordinate;
  double coordinate_8;
  CLLocationCoordinate2D v36;
  CLLocationCoordinate2D v37;

  v32 = v5;
  v33 = v6;
  v7 = v4;
  v8 = v3;
  v10 = -[MapRoutePageRenderer overviewRect](self, "overviewRect", a3);
  v28 = v12 * 0.5;
  v29 = v11 * 0.5;
  v30 = v8;
  v31 = v7;
  MKTilePointForCoordinate(v10, v8, v7, 20.0);
  v14 = 20;
  while (1)
  {
    v15 = MKTilePointForCoordinate(v13, v30, v31, (double)v14);
    v17 = v16;
    v18 = v16 - v28;
    v19 = v28 + v16;
    coordinate = MKCoordinateForTilePoint(v15 - v29, v16, (double)v14);
    v21 = v20;
    v22 = MKCoordinateForTilePoint(v29 + v15, v17, (double)v14);
    v24 = v23;
    coordinate_8 = MKCoordinateForTilePoint(v15, v18, (double)v14);
    v25 = MKCoordinateForTilePoint(v15, v19, (double)v14);
    v36.latitude = coordinate;
    v36.longitude = v21;
    self->mlMapPoint = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapPointForCoordinate(v36);
    v37.latitude = v22;
    v37.longitude = v24;
    self->mrMapPoint = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapPointForCoordinate(v37);
    if (coordinate_8 - v25 + 0.0001 >= v32 && v24 - v21 + 0.0001 >= v33)
      break;
    if (--v14 <= 3)
    {
      v14 = 3;
      break;
    }
  }
  self->topLeftCorner.x = v15 - v29;
  self->topLeftCorner.y = v18;
  return (double)v14;
}

@end
