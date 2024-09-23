@implementation _AConnectURLHandlingTask

- (void)performTask
{
  RichMapsActivity *v3;
  AppleConnectAction *v4;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v4 = objc_alloc_init(AppleConnectAction);
  v3 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v4);
  -[URLHandlingTask taskFinished:](self, "taskFinished:", v3);

}

@end
