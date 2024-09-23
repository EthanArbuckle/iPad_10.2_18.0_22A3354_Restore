@implementation DMDSetPasscodeLockGracePeriodOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSetPasscodeLockGracePeriodRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C31B0;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v4, "seconds");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  objc_msgSend(v5, "setValue:forSetting:", v8, MCFeaturePasscodeLockGraceTime);

  -[DMDSetPasscodeLockGracePeriodOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

@end
