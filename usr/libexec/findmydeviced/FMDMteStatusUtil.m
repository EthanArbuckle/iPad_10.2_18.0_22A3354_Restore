@implementation FMDMteStatusUtil

+ (void)fetchMteStatusWithCompletion:(id)a3
{
  void (**v3)(id, const __CFString *, void *);
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(id, const __CFString *, void *);
  _QWORD v16[4];
  void (**v17)(id, const __CFString *, void *);
  id v18;

  v3 = (void (**)(id, const __CFString *, void *))a3;
  v18 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl CKKSControlObject:error:](CKKSControl, "CKKSControlObject:error:", 0, &v18));
  v5 = v18;
  if (v5)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10022C9F0((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);

    v15 = (void (**)(id, const __CFString *, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    v3[2](v3, CFSTR("controlObjCreationError"), v15);
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A69E8;
    v16[3] = &unk_1002C4B90;
    v17 = v3;
    objc_msgSend(v4, "rpcStatus:reply:", CFSTR("Manatee"), v16);
    v15 = v17;
  }

}

@end
