@implementation STUFetchInternetDateOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchInternetDateOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchInternetDateRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CATErrorWithCodeAndUserInfo(2, &off_1000D3268);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRKPlatformInternetDateProvider sharedProvider](CRKPlatformInternetDateProvider, "sharedProvider", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100026DEC;
  v5[3] = &unk_1000CA4F8;
  v5[4] = self;
  objc_msgSend(v4, "fetchInternetDateWithCompletion:", v5);

}

@end
