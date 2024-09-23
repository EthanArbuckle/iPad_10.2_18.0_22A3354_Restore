@implementation DMDSetAppAnalyticsEnabledOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSetAppAnalyticsEnabledRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3060;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v6 = objc_msgSend(v4, "enabled");

  objc_msgSend(v5, "setBoolValue:forSetting:", v6, MCFeatureAppAnalyticsAllowed);
  -[DMDSetAppAnalyticsEnabledOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

@end
