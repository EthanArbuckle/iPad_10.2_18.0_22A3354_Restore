@implementation RAPIncidentsQuestion

- (RAPIncidentsQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 incidentLayoutItem:(id)a5
{
  id v8;
  id v9;
  RAPIncidentsQuestion *v10;
  RAPIncidentsQuestion *v11;
  void *v12;
  void *v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RAPIncidentsQuestion;
  v10 = -[RAPQuestion initWithReport:parentQuestion:](&v17, "initWithReport:parentQuestion:", v8, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_incidentLayoutItem, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_context"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapCamera"));
    objc_msgSend(v13, "centerCoordinate");
    v11->_selectedCoordinate.latitude = v14;
    v11->_selectedCoordinate.longitude = v15;

    v11->_originalCoordinate = CLLocationCoordinate2DMake(v11->_selectedCoordinate.latitude, v11->_selectedCoordinate.longitude);
  }

  return v11;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  double Current;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));
  objc_msgSend(v6, "setClientCreatedAt:", Current);

  v7 = objc_alloc_init((Class)GEORPFeedbackDetails);
  objc_msgSend(v4, "setDetails:", v7);

  v8 = objc_alloc_init((Class)GEORPIncidentFeedback);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  objc_msgSend(v9, "setIncidentFeedback:", v8);

  v16 = objc_alloc_init((Class)GEORPNewIncidentDetails);
  v10 = objc_alloc_init((Class)GEORPIncidentLocation);
  objc_msgSend(v16, "setIncidentLocation:", v10);

  v11 = objc_msgSend(objc_alloc((Class)GEOLatLng), "initWithLatitude:longitude:", self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "incidentLocation"));
  objc_msgSend(v12, "setLatLng:", v11);

  objc_msgSend(v16, "setType:", -[TrafficIncidentLayoutItem incidentType](self->_incidentLayoutItem, "incidentType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "incidentFeedback"));
  objc_msgSend(v14, "setNewIncidentDetails:", v16);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPIncidentsQuestion commentQuestion](self, "commentQuestion"));
  objc_msgSend(v15, "_fillSubmissionParameters:", v4);

}

- (int64_t)questionCategory
{
  return 19;
}

- (int)userAction
{
  return 115;
}

- (UIImage)image
{
  return (UIImage *)-[TrafficIncidentLayoutItem displayImage](self->_incidentLayoutItem, "displayImage");
}

- (NSString)localizedTitle
{
  return (NSString *)-[TrafficIncidentLayoutItem displayText](self->_incidentLayoutItem, "displayText");
}

- (NSString)localizedDescription
{
  return (NSString *)-[TrafficIncidentLayoutItem descriptionText](self->_incidentLayoutItem, "descriptionText");
}

- ($C79183323B9A0D5602617FF3BE5395AC)coordinatePickingMapRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D v9;
  MKCoordinateRegion v10;
  $C79183323B9A0D5602617FF3BE5395AC result;

  -[RAPIncidentsQuestion selectedCoordinate](self, "selectedCoordinate");
  if (v4 < -180.0 || v4 > 180.0 || v3 < -90.0 || v3 > 90.0)
  {
    -[RAPIncidentsQuestion _initialCoordinatePickingMapRect](self, "_initialCoordinatePickingMapRect");
  }
  else
  {
    -[RAPIncidentsQuestion selectedCoordinate](self, "selectedCoordinate");
    v10 = MKCoordinateRegionMakeWithDistance(v9, 200.0, 200.0);
    v5 = MKMapRectForCoordinateRegion((__n128)v10.center, *(__n128 *)&v10.center.longitude, (__n128)v10.span, *(__n128 *)&v10.span.longitudeDelta);
  }
  result.var1.var1 = v8;
  result.var1.var0 = v7;
  result.var0.var1 = v6;
  result.var0.var0 = v5;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_initialCoordinatePickingMapRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
  v3 = sub_10043C9E4(v2);
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.var1.var1 = v13;
  result.var1.var0 = v12;
  result.var0.var1 = v11;
  result.var0.var0 = v10;
  return result;
}

- (RAPCommentQuestion)commentQuestion
{
  RAPCommentQuestion *commentQuestion;
  RAPCommentQuestion *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RAPCommentQuestion *v9;
  RAPCommentQuestion *v10;

  commentQuestion = self->_commentQuestion;
  if (!commentQuestion)
  {
    v4 = [RAPCommentQuestion alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCommentQuestion _localizedOptionalInformationTitle](RAPCommentQuestion, "_localizedOptionalInformationTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Add more information about the Incident"), CFSTR("localized string not found"), 0));
    v9 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](v4, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v5, self, v6, v8, 5);
    v10 = self->_commentQuestion;
    self->_commentQuestion = v9;

    commentQuestion = self->_commentQuestion;
  }
  return commentQuestion;
}

- (BOOL)isComplete
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPIncidentsQuestion commentQuestion](self, "commentQuestion"));
  v3 = objc_msgSend(v2, "isComplete");

  return v3;
}

- (void)setSelectedCoordinate:(CLLocationCoordinate2D)a3
{
  self->_selectedCoordinate = a3;
}

- (int)analyticTarget
{
  return 741;
}

- (NSString)eventValue
{
  return (NSString *)-[TrafficIncidentLayoutItem incidentTypeAsString](self->_incidentLayoutItem, "incidentTypeAsString");
}

- (TrafficIncidentLayoutItem)incidentLayoutItem
{
  return self->_incidentLayoutItem;
}

- (CLLocationCoordinate2D)selectedCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_selectedCoordinate.latitude;
  longitude = self->_selectedCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (CLLocationCoordinate2D)originalCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_originalCoordinate.latitude;
  longitude = self->_originalCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setOriginalCoordinate:(CLLocationCoordinate2D)a3
{
  self->_originalCoordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentLayoutItem, 0);
  objc_storeStrong((id *)&self->_commentQuestion, 0);
}

@end
