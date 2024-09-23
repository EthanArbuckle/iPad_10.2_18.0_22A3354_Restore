@implementation MKMapCamera

- (GEOURLCamera)geoCamera
{
  id v3;
  double v4;
  id v5;

  v3 = objc_alloc_init((Class)GEOURLCamera);
  -[MKMapCamera centerCoordinate](self, "centerCoordinate");
  objc_msgSend(v3, "setLatitude:");
  -[MKMapCamera centerCoordinate](self, "centerCoordinate");
  objc_msgSend(v3, "setLongitude:", v4);
  -[MKMapCamera heading](self, "heading");
  objc_msgSend(v3, "setHeading:");
  -[MKMapCamera pitch](self, "pitch");
  objc_msgSend(v3, "setPitch:");
  -[MKMapCamera altitude](self, "altitude");
  objc_msgSend(v3, "setAltitude:");
  objc_msgSend(v3, "latitude");
  objc_msgSend(v3, "longitude");
  objc_msgSend(v3, "heading");
  objc_msgSend(v3, "pitch");
  objc_msgSend(v3, "altitude");
  v5 = v3;

  return (GEOURLCamera *)v5;
}

@end
