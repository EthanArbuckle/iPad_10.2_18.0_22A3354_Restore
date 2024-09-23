@implementation SendToRoutingAppActivity

+ (BOOL)isActivityForType:(id)a3
{
  return objc_msgSend(CFSTR("com.apple.Maps.RoutingAppsActivity"), "isEqualToString:", a3);
}

- (id)activityImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, 20.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("appstore"), v2));

  return v3;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Routing Apps [Share sheet]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)activityType
{
  return CFSTR("com.apple.Maps.RoutingAppsActivity");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  -[SendToRoutingAppActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
