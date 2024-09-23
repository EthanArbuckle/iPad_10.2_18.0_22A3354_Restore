@implementation DMDRegisterConfigurationSourceOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFRegisterConfigurationSourceRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2F40;
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
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientBundleIdentifier"));

    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10005F0FC;
      v14[3] = &unk_1000BAD98;
      v14[4] = self;
      objc_msgSend(v9, "handleConfigurationSourceRegistrationRequest:clientIdentifier:completionHandler:", v4, v7, v14);
    }
    else
    {
      v11 = DMFConfigurationEngineLog(v8);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100079078(v12);

      v13 = DMFErrorWithCodeAndUserInfo(5, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
      -[DMDRegisterConfigurationSourceOperation endOperationWithError:](self, "endOperationWithError:", v9);
    }

  }
  else
  {
    v10 = DMFErrorWithCodeAndUserInfo(4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[DMDRegisterConfigurationSourceOperation endOperationWithError:](self, "endOperationWithError:", v7);
  }

}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  const __CFString **v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;

  v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___DMDRegisterConfigurationSourceOperation;
  if (!objc_msgSendSuper2(&v16, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configurationSourceName"));
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    if (!a4)
      goto LABEL_11;
    v19 = DMFInvalidParameterErrorKey;
    v20 = CFSTR("request.configurationSourceName");
    v11 = &v20;
    v12 = &v19;
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    if (!a4)
      goto LABEL_11;
    v17 = DMFInvalidParameterErrorKey;
    v18 = CFSTR("request.organizationIdentifier");
    v11 = &v18;
    v12 = &v17;
LABEL_9:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v12, 1));
    v14 = DMFErrorWithCodeAndUserInfo(1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v14);

LABEL_10:
    LOBYTE(a4) = 0;
    goto LABEL_11;
  }
  LOBYTE(a4) = 1;
LABEL_11:

  return (char)a4;
}

@end
