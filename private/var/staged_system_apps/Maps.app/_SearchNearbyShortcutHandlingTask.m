@implementation _SearchNearbyShortcutHandlingTask

- (int)analyticsActionType
{
  return 17082;
}

- (void)performTask
{
  RichMapsActivity *v3;
  MapsActivity *v4;
  RichMapsActivity *v5;
  PresentNearbySearchAction *v6;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v6 = objc_alloc_init(PresentNearbySearchAction);
  -[MapsAction setUserLocationAccuracy:](v6, "setUserLocationAccuracy:", kCLLocationAccuracyKilometer);
  v3 = [RichMapsActivity alloc];
  v4 = objc_alloc_init(MapsActivity);
  v5 = -[RichMapsActivity initWithMapsActivity:mapsAction:](v3, "initWithMapsActivity:mapsAction:", v4, v6);

  -[ShortcutHandlingTask taskFinished:](self, "taskFinished:", v5);
}

@end
