@implementation RAPAnnotation

- (RAPAnnotation)init
{
  RAPAnnotation *result;

  result = (RAPAnnotation *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (RAPAnnotation)initWithMapItem:(id)a3
{
  id v5;
  RAPAnnotation *v6;
  RAPAnnotation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPAnnotation;
  v6 = -[RAPAnnotation init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self->_item, "placemark"));
  objc_msgSend(v2, "coordinate");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (NSString)title
{
  return -[MKMapItem name](self->_item, "name");
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return (GEOFeatureStyleAttributes *)-[MKMapItem _maps_styleAttributesForMapItem](self->_item, "_maps_styleAttributesForMapItem");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
