@implementation MapsSuggestionsNavdMapsAppLocationManager

+ (id)sharedLocationManager
{
  if (qword_1014D2D80 != -1)
    dispatch_once(&qword_1014D2D80, &stru_1011BFCE8);
  return (id)qword_1014D2D78;
}

- (MapsSuggestionsNavdMapsAppLocationManager)initWithName:(id)a3 queue:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsNavdMapsAppLocationManager;
  return -[MapsSuggestionsNavdLocationManager initWithName:locationBundleID:queue:](&v5, "initWithName:locationBundleID:queue:", a3, MapsAppBundleId, a4);
}

- (BOOL)hasLocationAccess
{
  void *v3;
  BOOL v4;

  if (+[CLLocationManager authorizationStatusForBundleIdentifier:](CLLocationManager, "authorizationStatusForBundleIdentifier:", MapsAppBundleId)- 3 > 1)return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsNavdLocationManager locationManager](self, "locationManager"));
  v4 = objc_msgSend(v3, "accuracyAuthorization") == 0;

  return v4;
}

@end
