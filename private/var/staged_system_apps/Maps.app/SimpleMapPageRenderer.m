@implementation SimpleMapPageRenderer

- (SimpleMapPageRenderer)initWithMapView:(id)a3
{
  id v4;
  SimpleMapPageRenderer *v5;
  SimpleMapPageRenderer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SimpleMapPageRenderer;
  v5 = -[MapPageRenderer init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MapPageRenderer setMapView:](v5, "setMapView:", v4);

  return v6;
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

  -[SimpleMapPageRenderer paperRect](self, "paperRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SimpleMapPageRenderer printableRect](self, "printableRect");
  r2 = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v18 = CGRectGetWidth(v20) + -126.0;
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
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  MKMapPoint v9;

  -[MKMapView _zoomLevel](self->super._mapView, "_zoomLevel", a3.location, a3.length);
  self->super._zoomLevel = v4;
  -[MapPageRenderer visibleMapRect](self, "visibleMapRect");
  v9.x = v6 + v5 * 0.5;
  v9.y = v8 + v7 * 0.5;
  self->super._centerCoordinate = MKCoordinateForMapPoint(v9);
}

- (void)_setTitlesWithMapItem:(id)a3
{
  void *v4;
  void *v5;
  double widthInMeters;
  NSString *title;
  NSString *subTitle;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_geoAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "structuredAddress"));

  widthInMeters = self->_widthInMeters;
  title = self->super._title;
  self->super._title = 0;

  subTitle = self->super._subTitle;
  self->super._subTitle = 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "areaOfInterests"));
  v10 = v9;
  if (v9)
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
LABEL_16:
    v13 = self->super._title;
    self->super._title = v11;

    goto LABEL_17;
  }
  if (objc_msgSend(v5, "hasInlandWater"))
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inlandWater"));
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "hasOcean"))
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ocean"));
    goto LABEL_16;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_addressFormattedAsCity"));

  if (v12 && widthInMeters < 300000.0)
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_addressFormattedAsCity"));
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "hasSubLocality") && widthInMeters < 300000.0)
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subLocality"));
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "hasSubAdministrativeArea") && widthInMeters < 300000.0)
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subAdministrativeArea"));
    goto LABEL_16;
  }
  if ((objc_msgSend(v5, "hasAdministrativeArea") & 1) != 0)
  {
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "administrativeArea"));
    v16 = self->super._title;
    self->super._title = v15;

    goto LABEL_21;
  }
  if (objc_msgSend(v5, "hasCountry"))
  {
    v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "country"));
    v17 = self->super._title;
    self->super._title = v18;
    goto LABEL_24;
  }
LABEL_17:
  if (objc_msgSend(v5, "hasAdministrativeArea"))
  {
    v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "administrativeArea"));
LABEL_23:
    v17 = self->super._subTitle;
    self->super._subTitle = v14;
LABEL_24:

    goto LABEL_25;
  }
LABEL_21:
  if (objc_msgSend(v5, "hasCountry"))
  {
    v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "country"));
    goto LABEL_23;
  }
LABEL_25:

}

- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  objc_super v4;

  self->super._topContentIconType = 7;
  v4.receiver = self;
  v4.super_class = (Class)SimpleMapPageRenderer;
  -[MapPageRenderer drawTopContentInRect:forPageAtIndex:](&v4, "drawTopContentInRect:forPageAtIndex:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  MapScaleCell *v39;
  double height;
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  MKMapPoint v47;
  MKMapPoint v48;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[MapPageRenderer visibleMapRect](self, "visibleMapRect");
  v10 = v9 + v8 * 0.5;
  v13 = v12 + v11 * 0.5;
  v14 = -[SimpleMapPageRenderer overviewRect](self, "overviewRect");
  v16 = v15;
  v18 = v17;
  v20 = MKZoomScaleForZoomLevelF(v14, v19, self->super._zoomLevel);
  v21 = v16 / v20;
  v22 = v18 / v20;
  v47.x = v10 - v16 / v20 * 0.5;
  v47.y = v22 * 0.5 + v13 - v22 * 0.5;
  v48.x = v21 + v47.x;
  v48.y = v47.y;
  self->_widthInMeters = MKMetersBetweenMapPoints(v47, v48);
  v23 = objc_claimAutoreleasedReturnValue(-[MapPageRenderer snapshotBlock](self, "snapshotBlock"));
  v24 = (void *)v23;
  if (v23)
    (*(void (**)(uint64_t))(v23 + 16))(v23);
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ticketForReverseGeocodeCoordinate:", self->super._centerCoordinate.latitude, self->super._centerCoordinate.longitude));

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1003C90DC;
  v42[3] = &unk_1011B4440;
  v42[4] = self;
  v42[5] = &v43;
  objc_msgSend(v26, "submitWithHandler:networkActivity:", v42, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  objc_msgSend(v27, "_enableManualPrintPage:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v29 = 0.0;
  while (!*((_BYTE *)v44 + 24))
  {
    if (v29 > 30.0)
      goto LABEL_13;
LABEL_12:
    v31 = objc_autoreleasePoolPush();
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
    objc_msgSend(v32, "runUntilDate:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v34, "timeIntervalSinceDate:", v28);
    v29 = v35;

    objc_autoreleasePoolPop(v31);
  }
  if (!self->super._hasSnapshot && v29 <= 30.0)
    goto LABEL_12;
LABEL_13:
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "printPageRenderer"));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
    objc_msgSend(v38, "_enableManualPrintPage:", 0);

    -[MapPageRenderer drawOverview](self, "drawOverview");
    v39 = -[MapScaleCell initWithDistanceInMeters:]([MapScaleCell alloc], "initWithDistanceInMeters:", self->_widthInMeters);
    -[SimpleMapPageRenderer overviewRect](self, "overviewRect");
    -[MapScaleCell drawInRect:](v39, "drawInRect:");
    -[SimpleMapPageRenderer drawTopContentInRect:forPageAtIndex:](self, "drawTopContentInRect:forPageAtIndex:", a3, x, y, width, height);

  }
  _Block_object_dispose(&v43, 8);

}

@end
