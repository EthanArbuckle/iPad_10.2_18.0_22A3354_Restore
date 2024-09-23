@implementation STUFetchEasyMAIDSignInEligibilityOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchEasyMAIDSignInEligibilityOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchEasyMAIDSignInEligibilityRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CATErrorWithCodeAndUserInfo(2, &off_1000D30B0);
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
  void *v5;
  _QWORD v6[5];

  v4 = (void *)objc_opt_new(CRKASMRosterProviderFactory);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "makeEasyMAIDSignInRosterProvider"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000223E4;
  v6[3] = &unk_1000CA310;
  v6[4] = self;
  objc_msgSend(v5, "fetchEligibilityForEasyMAIDSignInWithCompletion:", v6);

}

@end
