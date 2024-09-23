@implementation DMDClearActivationLockBypassCodeOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFClearActivationLockBypassCodeRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2A18;
}

- (void)runWithRequest:(id)a3
{
  +[MCCrypto clearStoredActivationLockBypassCode](MCCrypto, "clearStoredActivationLockBypassCode", a3);
  -[DMDClearActivationLockBypassCodeOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

@end
