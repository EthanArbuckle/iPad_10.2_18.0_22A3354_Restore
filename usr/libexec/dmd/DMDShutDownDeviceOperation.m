@implementation DMDShutDownDeviceOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFShutDownDeviceRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C31F8;
}

- (void)runWithRequest:(id)a3
{
  void *v3;
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)FBSShutdownOptions), "initWithReason:", CFSTR("dmd shut down device"));
  objc_msgSend(v4, "setRebootType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](FBSSystemService, "sharedService"));
  objc_msgSend(v3, "shutdownWithOptions:", v4);

}

@end
