@implementation _MarkUserLocationShortcutHandlingTask

- (int)analyticsActionType
{
  return 17081;
}

- (void)performTask
{
  RichMapsActivity *v3;
  MarkUserLocationAction *v4;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v4 = objc_alloc_init(MarkUserLocationAction);
  -[MapsAction setUserLocationAccuracy:](v4, "setUserLocationAccuracy:", kCLLocationAccuracyBest);
  v3 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v4);
  -[ShortcutHandlingTask taskFinished:](self, "taskFinished:", v3);

}

@end
