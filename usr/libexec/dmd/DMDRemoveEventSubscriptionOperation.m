@implementation DMDRemoveEventSubscriptionOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDRemoveEventSubscriptionOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_11;
    v17 = DMFInvalidParameterErrorKey;
    v18 = CFSTR("request.organizationIdentifier");
    v9 = &v18;
    v10 = &v17;
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptionDeclaration"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_11;
    v15 = DMFInvalidParameterErrorKey;
    v16 = CFSTR("request.subscriptionDeclaration");
    v9 = &v16;
    v10 = &v15;
LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v10, 1));
    v12 = DMFErrorWithCodeAndUserInfo(1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);

LABEL_10:
    LOBYTE(a4) = 0;
    goto LABEL_11;
  }
  LOBYTE(a4) = 1;
LABEL_11:

  return (char)a4;
}

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMDRemoveEventSubscriptionRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &__NSArray0__struct;
}

- (unint64_t)queueGroup
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100060F8C;
  v6[3] = &unk_1000BAD98;
  v6[4] = self;
  objc_msgSend(v5, "handleRemoveSubscriptionRequest:completionHandler:", v4, v6);

}

@end
