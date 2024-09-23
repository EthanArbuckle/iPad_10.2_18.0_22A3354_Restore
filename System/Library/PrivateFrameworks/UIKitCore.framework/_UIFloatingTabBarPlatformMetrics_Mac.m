@implementation _UIFloatingTabBarPlatformMetrics_Mac

- (_UIFloatingTabBarPlatformMetrics_Mac)init
{
  _UIFloatingTabBarPlatformMetrics_Mac *v2;
  _UIFloatingTabBarPlatformMetrics_Mac *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFloatingTabBarPlatformMetrics_Mac;
  v2 = -[_UIFloatingTabBarPlatformMetrics init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UIFloatingTabBarPlatformMetrics setBackgroundEffect:](v2, "setBackgroundEffect:", 0);
  return v3;
}

@end
