@implementation TransitVehicleLineAnnotation

- (TransitVehicleLineAnnotation)initWithTransitLine:(id)a3
{
  id v5;
  TransitVehicleLineAnnotation *v6;
  TransitVehicleLineAnnotation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitVehicleLineAnnotation;
  v6 = -[TransitVehicleLineAnnotation init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transitLine, a3);

  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = MKCoordinateInvalid[0];
  v3 = MKCoordinateInvalid[1];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (UIColor)color
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehicleLineAnnotation transitLine](self, "transitLine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lineColorString"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_colorFromHexString:](UIColor, "_maps_colorFromHexString:", v3));
  return (UIColor *)v4;
}

- (id)imageWithScale:(double)a3 nightMode:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehicleLineAnnotation transitLine](self, "transitLine"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modeArtwork"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtworkManager sharedInstance](MKTransitArtworkManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:", v7, 6, 2, v4, a3));

  return v9;
}

- (BOOL)allowsAccuracyRing
{
  return 0;
}

- (BOOL)allowsTimestampLabel
{
  return 0;
}

- (GEOTransitLine)transitLine
{
  return self->_transitLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLine, 0);
}

@end
