@implementation DMDStopManagingBooksOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFStopManagingBooksRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3240;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPowerAssertion assertionForOperation:](DMDPowerAssertion, "assertionForOperation:", CFSTR("DMDStopManagingBooksOperation: run")));
  if ((MCHasMDMMigrated() & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDManagedMediaManager sharedManager](DMDManagedMediaManager, "sharedManager"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100065F74;
    v6[3] = &unk_1000BA4B0;
    v6[4] = self;
    objc_msgSend(v5, "uprootWithAssertion:completionBlock:", v4, v6);

  }
  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 1650);
  }

}

@end
