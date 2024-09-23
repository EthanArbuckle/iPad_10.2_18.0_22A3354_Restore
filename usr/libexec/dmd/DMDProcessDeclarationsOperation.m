@implementation DMDProcessDeclarationsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFProcessDeclarationsRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2EC8;
}

- (unint64_t)queueGroup
{
  return 1;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "organizationIdentifier"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005E42C;
    v9[3] = &unk_1000BAD98;
    v9[4] = self;
    objc_msgSend(v6, "processDeclarationsForOrganizationWithIdentifier:completionHandler:", v7, v9);

  }
  else
  {
    v8 = DMFErrorWithCodeAndUserInfo(4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[DMDProcessDeclarationsOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }

}

@end
