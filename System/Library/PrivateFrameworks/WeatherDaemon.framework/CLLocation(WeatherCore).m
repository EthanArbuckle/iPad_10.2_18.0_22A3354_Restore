@implementation CLLocation(WeatherCore)

- (BOOL)shiftedReferenceFrame
{
  return objc_msgSend(a1, "referenceFrame") == 2;
}

@end
