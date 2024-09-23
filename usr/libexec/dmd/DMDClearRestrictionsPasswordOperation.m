@implementation DMDClearRestrictionsPasswordOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFClearRestrictionsPasswordRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2A30;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)qword_1000EB798;
  v16 = qword_1000EB798;
  if (!qword_1000EB798)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100025B74;
    v12[3] = &unk_1000B9F10;
    v12[4] = &v13;
    sub_100025B74((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  v7 = (void *)objc_opt_new(v6);
  v8 = v7;
  if (!v7)
  {
    v10 = 0;
    goto LABEL_7;
  }
  v11 = 0;
  v9 = objc_msgSend(v7, "clearRestrictionsPasscodeWithError:", &v11);
  v10 = v11;
  if ((v9 & 1) != 0)
  {
LABEL_7:
    -[DMDClearRestrictionsPasswordOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    goto LABEL_8;
  }
  -[DMDClearRestrictionsPasswordOperation endOperationWithError:](self, "endOperationWithError:", v10);
LABEL_8:

}

@end
