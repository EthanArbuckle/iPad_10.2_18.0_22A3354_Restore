@implementation RAPArrivalEntryPointIncorrectQuestion

- (RAPArrivalEntryPointIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 arrivalPoint:(CLLocationCoordinate2D)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  RAPArrivalEntryPointIncorrectQuestion *result;
  objc_super v8;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v8.receiver = self;
  v8.super_class = (Class)RAPArrivalEntryPointIncorrectQuestion;
  result = -[RAPQuestion initWithReport:parentQuestion:](&v8, "initWithReport:parentQuestion:", a3, a4);
  if (result)
  {
    result->_originalCoordinate.latitude = latitude;
    result->_originalCoordinate.longitude = longitude;
    result->_selectedCoordinate = result->_originalCoordinate;
    result->_mapType = 0;
    result->_showPin = 1;
  }
  return result;
}

- (int)analyticTarget
{
  return 1105;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (BOOL)showPin
{
  return self->_showPin;
}

- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  MKCoordinateRegion v6;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v6 = MKCoordinateRegionMakeWithDistance(self->_selectedCoordinate, 50.0, 50.0);
  MKMapRectForCoordinateRegion((__n128)v6.center, *(__n128 *)&v6.center.longitude, (__n128)v6.span, *(__n128 *)&v6.span.longitudeDelta);
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (CLLocationCoordinate2D)coordinate
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

- (unint64_t)coordinatePickingMapType
{
  return self->_mapType;
}

- (void)setSelectedCoordinate:(CLLocationCoordinate2D)a3
{
  if (vabdd_f64(a3.latitude, self->_selectedCoordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_selectedCoordinate.longitude) >= 0.00000000999999994)
  {
    self->_selectedCoordinate = a3;
    -[RAPQuestion _didChange](self, "_didChange");
  }
}

- (BOOL)isComplete
{
  CLLocationDegrees latitude;
  double longitude;
  BOOL v4;
  char v5;

  latitude = self->_selectedCoordinate.latitude;
  longitude = self->_selectedCoordinate.longitude;
  v4 = vabdd_f64(latitude, self->_originalCoordinate.latitude) >= 0.00000000999999994;
  v5 = vabdd_f64(longitude, self->_originalCoordinate.longitude) >= 0.00000000999999994 || v4;
  return CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&latitude) & v5;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Arrival Entrance [Report a Problem category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)localizedCoordinatePickingPrompt
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Pan the map to position the entrance [Report a Problem]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCommentQuestion _localizedMoreInformationTitle](RAPCommentQuestion, "_localizedMoreInformationTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Add more details about the incorrect arrival entrance"), CFSTR("localized string not found"), 0));
    v9 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](v4, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v5, self, v6, v8, 2);
    v10 = self->_commentQuestion;
    self->_commentQuestion = v9;

    commentQuestion = self->_commentQuestion;
  }
  return commentQuestion;
}

- (BOOL)_isRecursivelyComplete
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[RAPQuestion _isRecursivelyComplete](self->_commentQuestion, "_isRecursivelyComplete");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPArrivalEntryPointIncorrectQuestion;
    LOBYTE(v3) = -[RAPQuestion _isRecursivelyComplete](&v5, "_isRecursivelyComplete");
  }
  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CLLocationCoordinate2D *p_selectedCoordinate;
  CLLocationCoordinate2D *p_originalCoordinate;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "setType:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "commonContext"));

  if (!v4)
  {
    v5 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v23, "setCommonContext:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "commonContext"));
  objc_msgSend(v6, "addUserPath:", 46);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPArrivalEntryPointIncorrectQuestion commentQuestion](self, "commentQuestion"));
  objc_msgSend(v7, "_fillSubmissionParameters:", v23);

  p_selectedCoordinate = &self->_selectedCoordinate;
  if (CLLocationCoordinate2DIsValid(self->_selectedCoordinate))
  {
    p_originalCoordinate = &self->_originalCoordinate;
    if (vabdd_f64(self->_originalCoordinate.latitude, p_selectedCoordinate->latitude) >= 0.00000000999999994
      || vabdd_f64(self->_originalCoordinate.longitude, self->_selectedCoordinate.longitude) >= 0.00000000999999994)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "details"));

      if (!v10)
      {
        v11 = objc_alloc_init((Class)GEORPFeedbackDetails);
        objc_msgSend(v23, "setDetails:", v11);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "details"));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "directionsFeedback"));

      if (!v13)
      {
        v13 = objc_alloc_init((Class)GEORPDirectionsFeedback);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "details"));
        objc_msgSend(v14, "setDirectionsFeedback:", v13);

      }
      objc_msgSend(v13, "setCorrectionType:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "details"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "directionsFeedback"));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "directionsCorrections"));

      if (!v17)
      {
        v17 = objc_alloc_init((Class)GEORPDirectionsCorrections);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "details"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "directionsFeedback"));
        objc_msgSend(v19, "setDirectionsCorrections:", v17);

      }
      v20 = objc_alloc_init((Class)GEORPCorrectedCoordinate);
      v21 = objc_msgSend(objc_alloc((Class)GEOLatLng), "initWithLatitude:longitude:", p_selectedCoordinate->latitude, p_selectedCoordinate->longitude);
      objc_msgSend(v20, "setCorrectedCoordinate:", v21);

      v22 = objc_msgSend(objc_alloc((Class)GEOLatLng), "initWithLatitude:longitude:", p_originalCoordinate->latitude, p_originalCoordinate->longitude);
      objc_msgSend(v20, "setOriginalCoordinate:", v22);

      objc_msgSend(v17, "setArrivalCoordinate:", v20);
    }
  }

}

- (int64_t)questionCategory
{
  return 4;
}

- (int)userAction
{
  return 10103;
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

- (unint64_t)maptype
{
  return self->_maptype;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentQuestion, 0);
}

@end
