@implementation _LicensePlateURLHandlingTask

- (void)performTask
{
  RichMapsActivity *v3;
  ShowLPROnboardingAction *v4;

  v4 = objc_alloc_init(ShowLPROnboardingAction);
  v3 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v4);
  -[URLHandlingTask taskFinished:](self, "taskFinished:", v3);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2115, 672, 0);

}

@end
