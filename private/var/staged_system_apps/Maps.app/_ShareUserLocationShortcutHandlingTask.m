@implementation _ShareUserLocationShortcutHandlingTask

- (int)analyticsActionType
{
  return 17083;
}

- (void)performTask
{
  RichMapsActivity *v3;
  ShareUserLocationAction *v4;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v4 = objc_alloc_init(ShareUserLocationAction);
  -[MapsAction setUserLocationAccuracy:](v4, "setUserLocationAccuracy:", kCLLocationAccuracyBest);
  v3 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v4);
  -[ShortcutHandlingTask taskFinished:](self, "taskFinished:", v3);

}

@end
