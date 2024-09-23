@implementation DMDSetMaximumResidentUsersOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSetMaximumResidentUsersRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3198;
}

- (void)runWithRequest:(id)a3
{
  const __CFString *v4;
  NSNumber *v5;
  const __CFString *v6;

  v4 = (const __CFString *)kMCMaximumResidentUsersKey;
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  v6 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  CFPreferencesSetAppValue(v4, v5, kMCNotBackedUpPreferencesDomain);
  CFPreferencesAppSynchronize(v6);
  -[DMDSetMaximumResidentUsersOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

@end
