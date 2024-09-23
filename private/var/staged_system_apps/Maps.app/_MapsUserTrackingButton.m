@implementation _MapsUserTrackingButton

- (int64_t)_activityIndicatorStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MapsUserTrackingButton theme](self, "theme"));
  v3 = objc_msgSend(v2, "activityIndicatorStyle");

  return (int64_t)v3;
}

@end
