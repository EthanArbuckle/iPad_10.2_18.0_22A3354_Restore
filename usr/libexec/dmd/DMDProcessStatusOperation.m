@implementation DMDProcessStatusOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFProcessStatusRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2EE0;
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
    v9[2] = sub_10005E570;
    v9[3] = &unk_1000BAD98;
    v9[4] = self;
    objc_msgSend(v6, "processStatusForOrganizationWithIdentifier:completionHandler:", v7, v9);

  }
  else
  {
    v8 = DMFErrorWithCodeAndUserInfo(4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[DMDProcessStatusOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }

}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DMDProcessStatusOperation;
  return objc_msgSendSuper2(&v5, "validateRequest:error:", a3, a4);
}

@end
