@implementation STUSetRequestingUnenrollmentFromControlGroupOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _UNKNOWN **v10;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___STUSetRequestingUnenrollmentFromControlGroupOperation;
  if (!objc_msgSendSuper2(&v13, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(CRKSetRequestingUnenrollmentFromControlGroupRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v10 = &off_1000D4000;
LABEL_9:
      v11 = CATErrorWithCodeAndUserInfo(2, v10);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_11;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));

  if (!v8)
  {
    if (a4)
    {
      v10 = &off_1000D4028;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  char v14;
  uint8_t buf[4];
  STUSetRequestingUnenrollmentFromControlGroupOperation *v16;
  __int16 v17;
  const __CFString *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationManager"));

  v7 = objc_msgSend(v4, "requestingUnenroll");
  if (qword_1000FC6A0 != -1)
    dispatch_once(&qword_1000FC6A0, &stru_1000CBE48);
  v8 = qword_1000FC698;
  if (os_log_type_enabled((os_log_t)qword_1000FC698, OS_LOG_TYPE_INFO))
  {
    v9 = CFSTR("Canceling Request");
    if ((_DWORD)v7)
      v9 = CFSTR("Requesting Unenroll");
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: Asserting requesting-unenrollment state: %{public}@", buf, 0x16u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100075A08;
  v12[3] = &unk_1000CBE28;
  v12[4] = self;
  v13 = v4;
  v14 = (char)v7;
  v11 = v4;
  objc_msgSend(v6, "setRequestUnenroll:forCourseWithIdentifier:completion:", v7, v10, v12);

}

@end
