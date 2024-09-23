@implementation CLLocationManager

+ (id)navdLocationBundleSource
{
  return CFSTR("/System/Library/LocationBundles/NavdLocationBundleiOS.bundle");
}

+ (id)inUseAssertionForNavd
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CLLocationManager navdLocationBundleSource](CLLocationManager, "navdLocationBundleSource"));
  v3 = +[CLInUseAssertion newAssertionForBundleIdentifier:withReason:](CLInUseAssertion, "newAssertionForBundleIdentifier:withReason:", v2, CFSTR("Location in use in navd"));

  return v3;
}

@end
