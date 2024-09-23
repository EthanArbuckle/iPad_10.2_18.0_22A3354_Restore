@implementation DMDFetchManagedBooksOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchManagedBooksRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2CB8;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  DMDFetchManagedBooksOperation *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPowerAssertion assertionForOperation:](DMDPowerAssertion, "assertionForOperation:", CFSTR("DMDFetchManagedBooksOperation: run")));
  if ((MCHasMDMMigrated() & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004648C;
    v6[3] = &unk_1000B9BA8;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[DMDManagedMediaManager sharedManager](DMDManagedMediaManager, "sharedManager"));
    v8 = self;
    v5 = v7;
    objc_msgSend(v5, "cleanUpWithAssertion:completionBlock:", v4, v6);

  }
  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 1650);
  }

}

@end
