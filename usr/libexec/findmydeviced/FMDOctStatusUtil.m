@implementation FMDOctStatusUtil

+ (void)fetchOctStatusWithCompletion:(id)a3
{
  void (**v3)(id, const __CFString *, void *);
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(id, const __CFString *, void *);
  _QWORD v12[4];
  void (**v13)(id, const __CFString *, void *);
  id v14;

  v3 = (void (**)(id, const __CFString *, void *))a3;
  v14 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OTControl controlObject:error:](OTControl, "controlObject:error:", 1, &v14));
  v5 = v14;
  if (v5)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10022A27C((uint64_t)v5, v8, v9);

    v11 = (void (**)(id, const __CFString *, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    v3[2](v3, CFSTR("controlObjCreationError"), v11);
  }
  else
  {
    v10 = OTDefaultContext;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000713F4;
    v12[3] = &unk_1002C31C0;
    v13 = v3;
    objc_msgSend(v4, "status:context:reply:", 0, v10, v12);
    v11 = v13;
  }

}

@end
