@implementation DMDCreateConfigurationOrganizationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFCreateConfigurationOrganizationRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2B08;
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
    v8[2] = sub_10003494C;
    v8[3] = &unk_1000BAD98;
    v8[4] = self;
    objc_msgSend(v6, "handleCreateConfigurationOrganizationRequest:completionHandler:", v4, v8);
  }
  else
  {
    v7 = DMFErrorWithCodeAndUserInfo(4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[DMDCreateConfigurationOrganizationOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }

}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString **v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___DMDCreateConfigurationOrganizationOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v6, a4))
    goto LABEL_13;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_14;
    v20 = DMFInvalidParameterErrorKey;
    v21 = CFSTR("request.organizationIdentifier");
    v10 = &v21;
    v11 = &v20;
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationDisplayName"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_14;
    v18 = DMFInvalidParameterErrorKey;
    v19 = CFSTR("request.organizationDisplayName");
    v10 = &v19;
    v11 = &v18;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationType"));

  if (!v9)
  {
    if (!a4)
      goto LABEL_14;
    v16 = DMFInvalidParameterErrorKey;
    v17 = CFSTR("request.organizationType");
    v10 = &v17;
    v11 = &v16;
LABEL_12:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v11, 1));
    v13 = DMFErrorWithCodeAndUserInfo(1, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);

LABEL_13:
    LOBYTE(a4) = 0;
    goto LABEL_14;
  }
  LOBYTE(a4) = 1;
LABEL_14:

  return (char)a4;
}

@end
