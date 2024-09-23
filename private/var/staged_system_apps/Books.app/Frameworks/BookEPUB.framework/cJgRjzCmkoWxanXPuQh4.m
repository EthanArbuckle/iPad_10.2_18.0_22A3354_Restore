@implementation cJgRjzCmkoWxanXPuQh4

+ (tpZFqotcPt)tpZFqotcPt
{
  if (qword_3CEE88 != -1)
    dispatch_once(&qword_3CEE88, &stru_388280);
  return (tpZFqotcPt *)qword_3CEE80;
}

- (cJgRjzCmkoWxanXPuQh4)initWithSinfData:(id)a3
{
  id v4;
  cJgRjzCmkoWxanXPuQh4 *v5;
  cJgRjzCmkoWxanXPuQh4 *v6;
  tpZFqotcPt *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)cJgRjzCmkoWxanXPuQh4;
  v5 = -[cJgRjzCmkoWxanXPuQh4 init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    v7 = (tpZFqotcPt *)objc_msgSend((id)objc_opt_class(v5), "tpZFqotcPt");
    v6->mContextManager = v7;
    v12 = 0;
    v8 = sub_1D87BC((uint64_t)v7, (uint64_t)v4, &v12);
    v9 = v12;
    v10 = v12;
    if ((_DWORD)v8)
    {
      NSLog(CFSTR("[*] FairPlay error = %d"), v8);

      v6 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v6->mCryptRef, v9);
    }

  }
  return v6;
}

- (BOOL)BaSrRpzcWCyAjSdjbc8j:(char *)a3 withSize:(unint64_t)a4 into:(char *)a5 e2cxKLQOk3W4uL3KXTUm:(unint64_t *)a6 refetch:(BOOL *)a7 error:(id *)a8
{
  tpZFqotcPt *mContextManager;
  int v13;
  unint64_t v14;
  _BOOL4 v15;
  int v17;
  unsigned int v18;

  v17 = 0;
  v18 = a4;
  mContextManager = self->mContextManager;
  if (a4 >= 0x8000)
    LODWORD(a4) = 0x8000;
  tpZFqotcPt::E7CI7xMRxnQE2nWg(mContextManager, self->mCryptRef, (unsigned __int8 *)a3, a4, (unsigned __int8 *)a5, &v18, &v17);
  v13 = v17;
  if (v17)
  {
    if (a8)
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FairPlay"), v17, 0));
    v15 = tpZFqotcPt::Tb38ee2B31aD5Debb1q(self->mContextManager, v17);
    if (a7 && v15)
      *a7 = 1;
    if (a6)
    {
      v14 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    if (a7)
      *a7 = 0;
    if (a6)
    {
      v14 = v18;
LABEL_15:
      *a6 = v14;
    }
  }
  return v13 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCryptRef, 0);
}

@end
