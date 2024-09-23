@implementation DMDFetchDMDStateOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchDMDStateRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2C88;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDServer sharedServer](DMDServer, "sharedServer", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Server:\n%@\nApps:\n%@"), v4, v5));

  v6 = objc_msgSend(objc_alloc((Class)DMFFetchDMDStateResultObject), "initWithStateDescription:", v7);
  -[DMDFetchDMDStateOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v6);

}

@end
