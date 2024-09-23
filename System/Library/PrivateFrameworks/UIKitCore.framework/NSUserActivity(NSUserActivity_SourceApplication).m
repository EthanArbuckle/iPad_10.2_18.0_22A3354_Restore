@implementation NSUserActivity(NSUserActivity_SourceApplication)

- (id)_sourceApplication
{
  return objc_getAssociatedObject(a1, &kNSUserActivitySourceApplicationKey);
}

- (id)_originatingProcess
{
  return objc_getAssociatedObject(a1, &kNSUserActivityOriginatingProcessKey);
}

@end
