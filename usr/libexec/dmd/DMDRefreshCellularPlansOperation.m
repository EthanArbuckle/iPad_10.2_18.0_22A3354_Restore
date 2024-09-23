@implementation DMDRefreshCellularPlansOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFRefreshCellularPlansRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2EF8;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  uint64_t v13;
  objc_super v15;
  uint64_t v16;
  const __CFString *v17;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___DMDRefreshCellularPlansOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eSIMServerURL"));
  if (!v7
    || (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eSIMServerURL")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme")),
        v11 = objc_msgSend(&off_1000C2F10, "containsObject:", v10),
        v10,
        v9,
        v8,
        (v11 & 1) == 0))
  {
    if (!a4)
      goto LABEL_8;
    v16 = DMFInvalidParameterErrorKey;
    v17 = CFSTR("request.eSIMServerURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v13 = DMFErrorWithCodeAndUserInfo(1, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);

LABEL_7:
    LOBYTE(a4) = 0;
    goto LABEL_8;
  }
  LOBYTE(a4) = 1;
LABEL_8:

  return (char)a4;
}

- (id)invalidResponseError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  id v9;

  v8 = DMFCoreTelephonyErrorResponseKey;
  v9 = a3;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  v5 = DMFErrorWithCodeAndUserInfo(205, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  DMDCoreTelephonyConnection *v6;
  _QWORD v7[5];
  DMDCoreTelephonyConnection *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eSIMServerURL"));
    *(_DWORD *)buf = 136315394;
    v11 = "-[DMDRefreshCellularPlansOperation(iOS) runWithRequest:]";
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s with URL: %@", buf, 0x16u);

  }
  if (+[DMDMobileGestalt hasCellularDataCapability](DMDMobileGestalt, "hasCellularDataCapability"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005E964;
    v7[3] = &unk_1000BBC48;
    v7[4] = self;
    v8 = objc_opt_new(DMDCoreTelephonyConnection);
    v9 = v4;
    v6 = v8;
    -[DMDCoreTelephonyConnection fetchCachedVinylInfoWithCompletion:](v6, "fetchCachedVinylInfoWithCompletion:", v7);

  }
  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 202);
  }

}

@end
