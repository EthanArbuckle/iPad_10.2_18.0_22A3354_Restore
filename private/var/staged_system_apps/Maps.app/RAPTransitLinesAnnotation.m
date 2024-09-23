@implementation RAPTransitLinesAnnotation

- (RAPTransitLinesAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v7;
  RAPTransitLinesAnnotation *v8;
  RAPTransitLinesAnnotation *v9;
  NSString *v10;
  NSString *title;
  objc_super v13;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RAPTransitLinesAnnotation;
  v8 = -[RAPTransitLinesAnnotation init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v8->_coordinate.latitude = latitude;
    v8->_coordinate.longitude = longitude;
    v10 = (NSString *)objc_msgSend(v7, "copy");
    title = v9->_title;
    v9->_title = v10;

  }
  return v9;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
