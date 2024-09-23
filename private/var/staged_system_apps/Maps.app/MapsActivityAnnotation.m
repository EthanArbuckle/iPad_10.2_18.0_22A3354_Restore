@implementation MapsActivityAnnotation

- (MapsActivityAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4 subtitle:(id)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v9;
  id v10;
  MapsActivityAnnotation *v11;
  MapsActivityAnnotation *v12;
  NSString *v13;
  NSString *title;
  NSString *v15;
  NSString *subtitle;
  objc_super v18;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MapsActivityAnnotation;
  v11 = -[MapsActivityAnnotation init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    v11->_coordinate.latitude = latitude;
    v11->_coordinate.longitude = longitude;
    v13 = (NSString *)objc_msgSend(v9, "copy");
    title = v12->_title;
    v12->_title = v13;

    v15 = (NSString *)objc_msgSend(v10, "copy");
    subtitle = v12->_subtitle;
    v12->_subtitle = v15;

  }
  return v12;
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

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (MapsActivityAnnotation)initWithSearchResult:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  MapsActivityAnnotation *v11;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitle"));

  v11 = -[MapsActivityAnnotation initWithCoordinate:title:subtitle:](self, "initWithCoordinate:title:subtitle:", v9, v10, v6, v8);
  return v11;
}

@end
