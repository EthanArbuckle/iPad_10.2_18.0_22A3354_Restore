@implementation MapsRippleAnnotation

- (MapsRippleAnnotation)init
{
  MapsRippleAnnotation *v2;
  MapsRippleView *v3;
  MapsRippleView *rippleView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsRippleAnnotation;
  v2 = -[MapsRippleAnnotation init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(MapsRippleView);
    rippleView = v2->_rippleView;
    v2->_rippleView = v3;

    -[MapsRippleView setLooping:](v2->_rippleView, "setLooping:", 1);
  }
  return v2;
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

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (MapsRippleView)rippleView
{
  return self->_rippleView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rippleView, 0);
}

@end
