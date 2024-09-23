@implementation DMDFetchOrganizationsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchConfigurationOrganizationsRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2CD0;
}

- (unint64_t)queueGroup
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100046750;
    v8[3] = &unk_1000BB1A0;
    v8[4] = self;
    objc_msgSend(v6, "handleFetchConfigurationOrganizationsRequest:completionHandler:", v4, v8);
  }
  else
  {
    v7 = DMFErrorWithCodeAndUserInfo(4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[DMDFetchOrganizationsOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }

}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DMDFetchOrganizationsOperation;
  return objc_msgSendSuper2(&v5, "validateRequest:error:", a3, a4);
}

@end
