@implementation MapsSuggestionsNavdLBALocationManager

+ (id)sharedLocationManager
{
  if (qword_1014D36B0 != -1)
    dispatch_once(&qword_1014D36B0, &stru_1011D9638);
  return (id)qword_1014D36A8;
}

- (MapsSuggestionsNavdLBALocationManager)initWithName:(id)a3 queue:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsNavdLBALocationManager;
  return -[MapsSuggestionsNavdLocationManager initWithName:locationBundlePath:limitingBundleID:queue:](&v5, "initWithName:locationBundlePath:limitingBundleID:queue:", a3, CFSTR("/System/Library/LocationBundles/NavdLocationBundleiOS.bundle"), MapsAppBundleId, a4);
}

- (BOOL)hasLocationAccess
{
  void *v3;
  BOOL v4;

  if (+[CLLocationManager authorizationStatusForBundlePath:](CLLocationManager, "authorizationStatusForBundlePath:", CFSTR("/System/Library/LocationBundles/NavdLocationBundleiOS.bundle"))- 3 > 1)return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsNavdLocationManager locationManager](self, "locationManager"));
  v4 = objc_msgSend(v3, "accuracyAuthorization") == 0;

  return v4;
}

@end
