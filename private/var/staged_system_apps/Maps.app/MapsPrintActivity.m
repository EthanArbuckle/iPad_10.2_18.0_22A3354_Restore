@implementation MapsPrintActivity

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  -[MapsPrintActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
