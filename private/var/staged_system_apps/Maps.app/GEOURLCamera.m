@implementation GEOURLCamera

- (MKMapCamera)mapCamera
{
  id v3;
  double v4;
  CLLocationDegrees v5;
  CLLocationDegrees v6;
  CLLocationCoordinate2D v7;

  v3 = objc_alloc_init((Class)MKMapCamera);
  -[GEOURLCamera latitude](self, "latitude");
  v5 = v4;
  -[GEOURLCamera longitude](self, "longitude");
  v7 = CLLocationCoordinate2DMake(v5, v6);
  objc_msgSend(v3, "setCenterCoordinate:", v7.latitude, v7.longitude);
  -[GEOURLCamera heading](self, "heading");
  objc_msgSend(v3, "setHeading:");
  -[GEOURLCamera pitch](self, "pitch");
  objc_msgSend(v3, "setPitch:");
  -[GEOURLCamera altitude](self, "altitude");
  objc_msgSend(v3, "setAltitude:");
  return (MKMapCamera *)v3;
}

@end
