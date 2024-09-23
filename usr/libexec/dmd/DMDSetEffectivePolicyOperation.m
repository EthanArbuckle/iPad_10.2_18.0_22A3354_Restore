@implementation DMDSetEffectivePolicyOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMDSetEffectivePolicyRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &__NSArray0__struct;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "policyPersistence"));
  v7 = objc_msgSend(v4, "policy");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiers"));
  v10 = objc_msgSend(v4, "priority");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "organizationIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "declarationIdentifier"));

  v13[1] = 3221225472;
  v13[2] = sub_100063E3C;
  v13[3] = &unk_1000BAD98;
  v13[4] = self;
  v13[0] = _NSConcreteStackBlock;
  objc_msgSend(v6, "setEffectivePolicy:forType:identifiers:priority:organizationIdentifier:declarationIdentifier:completionHandler:", v7, v8, v9, v10, v11, v12, v13);

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
  v15.super_class = (Class)&OBJC_METACLASS___DMDSetEffectivePolicyOperation;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "declarationIdentifier"));

  if (!v8)
  {
    if (!a4)
      goto LABEL_14;
    v18 = DMFInvalidParameterErrorKey;
    v19 = CFSTR("request.declarationIdentifier");
    v10 = &v19;
    v11 = &v18;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));

  if (!v9)
  {
    if (!a4)
      goto LABEL_14;
    v16 = DMFInvalidParameterErrorKey;
    v17 = CFSTR("request.type");
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
