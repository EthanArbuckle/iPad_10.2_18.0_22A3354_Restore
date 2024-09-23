@implementation DMDSetDeviceNameOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFSetDeviceNameRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3138;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;
  const __CFString *v16;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDSetDeviceNameOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  if (!v7
    || (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name")),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v8,
        !v10))
  {
    if (!a4)
      goto LABEL_8;
    v15 = DMFInvalidParameterErrorKey;
    v16 = CFSTR("request.name");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v12 = DMFErrorWithCodeAndUserInfo(1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);

LABEL_7:
    LOBYTE(a4) = 0;
    goto LABEL_8;
  }
  LOBYTE(a4) = 1;
LABEL_8:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  v7 = 0;
  v5 = +[DMDLockdownUtilities setDeviceName:outError:](DMDLockdownUtilities, "setDeviceName:outError:", v4, &v7);
  v6 = v7;

  if (v5)
    -[DMDSetDeviceNameOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  else
    -[DMDSetDeviceNameOperation endOperationWithError:](self, "endOperationWithError:", v6);

}

@end
