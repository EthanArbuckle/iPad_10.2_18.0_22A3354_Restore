@implementation CLLocation(WFAdditions)

- (BOOL)wf_isEquivalentToLocation:()WFAdditions tolerance:
{
  id v6;
  double v7;
  _BOOL8 v8;
  CLLocationCoordinate2D v10;
  CLLocationCoordinate2D v11;

  v6 = a4;
  objc_msgSend(a1, "coordinate");
  if (CLLocationCoordinate2DIsValid(v10) || (objc_msgSend(v6, "coordinate"), CLLocationCoordinate2DIsValid(v11)))
  {
    objc_msgSend(a1, "distanceFromLocation:", v6);
    v8 = v7 < a2;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
