@implementation DMDFetchLocationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchLocationRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2CA0;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;
  const __CFString *v13;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDFetchLocationOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originator"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_7;
    v12 = DMFInvalidParameterErrorKey;
    v13 = CFSTR("request.originator");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v9 = DMFErrorWithCodeAndUserInfo(1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v9);

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  v6 = objc_msgSend(v5, "isManagedLostModeActive");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDLostDeviceLocationManager sharedManager](DMDLostDeviceLocationManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originator"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100046278;
    v9[3] = &unk_1000BB178;
    v9[4] = self;
    objc_msgSend(v7, "getCurrentLocationForOriginator:completion:", v8, v9);

  }
  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 601);
  }

}

@end
