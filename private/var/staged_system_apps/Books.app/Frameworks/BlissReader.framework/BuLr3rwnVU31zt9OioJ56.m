@implementation BuLr3rwnVU31zt9OioJ56

+ (tpZFqotcPt)RlXOkXCKRgyluEUOMXWx43md
{
  if (qword_5437E0 != -1)
    dispatch_once(&qword_5437E0, &stru_42C350);
  return (tpZFqotcPt *)qword_5437D8;
}

- (BuLr3rwnVU31zt9OioJ56)init
{
  BuLr3rwnVU31zt9OioJ56 *v2;
  BuLr3rwnVU31zt9OioJ56 *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BuLr3rwnVU31zt9OioJ56;
  v2 = -[BuLr3rwnVU31zt9OioJ56 init](&v5, "init");
  v3 = v2;
  if (v2)
    v2->mContextManager = (tpZFqotcPt *)objc_msgSend((id)objc_opt_class(v2), "RlXOkXCKRgyluEUOMXWx43md");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BuLr3rwnVU31zt9OioJ56 EXC6L9VofSI7ZuGjFga5qXiB](self, "EXC6L9VofSI7ZuGjFga5qXiB");
  v3.receiver = self;
  v3.super_class = (Class)BuLr3rwnVU31zt9OioJ56;
  -[BuLr3rwnVU31zt9OioJ56 dealloc](&v3, "dealloc");
}

- (id)setupWithSinfData:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id obj;

  v4 = a3;
  obj = 0;
  v5 = p69a8ed193df95a4f68(self->mContextManager, v4, &obj);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ibookserrors"), v5, 0));
  }
  else
  {
    objc_storeStrong((id *)&self->mCryptRef, obj);
    v6 = 0;
  }

  return v6;
}

- (void)EXC6L9VofSI7ZuGjFga5qXiB
{
  bb74bdd798ceadff5c1f0c2b *mCryptRef;
  bb74bdd798ceadff5c1f0c2b *v4;

  mCryptRef = self->mCryptRef;
  if (mCryptRef)
  {
    tpZFqotcPt::RTvM5X_G7QMNC67UE(self->mContextManager, mCryptRef);
    v4 = self->mCryptRef;
  }
  else
  {
    v4 = 0;
  }
  self->mCryptRef = 0;

}

+ (int64_t)dataChunkSize
{
  return 0x8000;
}

- (BOOL)BaSrRpzcWCyAjSdjbc8j:(char *)a3 withSize:(unint64_t)a4 into:(char *)a5 error:(id *)a6
{
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  int v17;
  unsigned int v18[2];

  if (a4 > 0x8000)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[BuLr3rwnVU31zt9OioJ56 BaSrRpzcWCyAjSdjbc8j:withSize:into:error:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDDecryptionSession.mm"));
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 115, CFSTR("input should be no bigger than the chunk size"));

  }
  *(_QWORD *)v18 = a4;
  v17 = 0;
  if (a4 >= 0x8000)
    v14 = 0x8000;
  else
    v14 = a4;
  tpZFqotcPt::E7CI7xMRxnQE2nWg(self->mContextManager, self->mCryptRef, (unsigned __int8 *)a3, v14, (unsigned __int8 *)a5, v18, &v17);
  v15 = v17;
  if (a6 && v17)
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ibookserrors"), v17, 0));
  return v15 == 0;
}

- (BOOL)No4wyWNg0kGgeb2ALodCkGRf:(char *)a3 withSize:(unint64_t)a4 into:(char *)a5 error:(id *)a6
{
  unint64_t v11;
  uint64_t v12;
  _BOOL4 v13;

  if (a4)
  {
    v11 = 0;
    do
    {
      if (a4 - v11 >= 0x8000)
        v12 = 0x8000;
      else
        v12 = a4 - v11;
      v13 = -[BuLr3rwnVU31zt9OioJ56 BaSrRpzcWCyAjSdjbc8j:withSize:into:error:](self, "BaSrRpzcWCyAjSdjbc8j:withSize:into:error:", &a3[v11], v12, &a5[v11], a6);
      v11 += v12;
    }
    while (v13 && v11 < a4);
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13;
}

+ (void)cmRVmZXRjaEJhZ0ZvckRTSUQ:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  tpZFqotcPt *v7;
  tpZFqotcPt *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = +[BuLr3rwnVU31zt9OioJ56 RlXOkXCKRgyluEUOMXWx43md](BuLr3rwnVU31zt9OioJ56, "RlXOkXCKRgyluEUOMXWx43md");
  if (v5)
  {
    v8 = v7;
    v9 = objc_msgSend(v5, "unsignedLongLongValue");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_20FE30;
    v11[3] = &unk_42C378;
    v12 = v6;
    tpZFqotcPt::A31bo2we343KEA87KF2(v8, v9, v11);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FairPlay"), -998, 0));
    if (v6)
      (*((void (**)(id, void *))v6 + 2))(v6, v10);

  }
}

+ (BOOL)XNRYWdSZWZldGNoUmxdWlyWQ:(int64_t)a3
{
  return tpZFqotcPt::Tb38ee2B31aD5Debb1q(+[BuLr3rwnVU31zt9OioJ56 RlXOkXCKRgyluEUOMXWx43md](BuLr3rwnVU31zt9OioJ56, "RlXOkXCKRgyluEUOMXWx43md"), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCryptRef, 0);
}

@end
