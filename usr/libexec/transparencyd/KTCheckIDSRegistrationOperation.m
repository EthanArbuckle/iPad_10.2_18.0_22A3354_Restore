@implementation KTCheckIDSRegistrationOperation

- (KTCheckIDSRegistrationOperation)initWithDependencies:(id)a3 application:(id)a4 pcs:(id)a5 idsRegistrationInterface:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  KTCheckIDSRegistrationOperation *v14;
  KTCheckIDSRegistrationOperation *v15;
  KTCheckIDSRegistrationOperation *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTCheckIDSRegistrationOperation;
  v14 = -[KTGroupOperation init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    -[KTCheckIDSRegistrationOperation setDeps:](v14, "setDeps:", v10);
    -[KTCheckIDSRegistrationOperation setApplication:](v15, "setApplication:", v11);
    -[KTCheckIDSRegistrationOperation setPcsOperation:](v15, "setPcsOperation:", v12);
    -[KTCheckIDSRegistrationOperation setIdsRegistrationInterface:](v15, "setIdsRegistrationInterface:", v13);
    -[KTCheckIDSRegistrationOperation setCheckIDSResult:](v15, "setCheckIDSResult:", 0);
    v16 = v15;
  }

  return v15;
}

+ (BOOL)checkPCSKTSignature:(id)a3 data:(id)a4 signature:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  const void *v10;
  char v11;

  v7 = a4;
  v8 = a5;
  v9 = PCSPublicIdentityCreateWithPublicKeyInfo(a3, 0);
  if (v9)
  {
    v10 = (const void *)v9;
    v11 = PCSValidateSignature(v9, v8, v7, 0);
    CFRelease(v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasRecentlyDoneHSA2Upsell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", -600.0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTCheckIDSRegistrationOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsAccountTracker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeOfLastUpsell"));
  v8 = objc_msgSend(v7, "compare:", v4) == (id)1;

  return v8;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTCheckIDSRegistrationOperation pcsOperation](self, "pcsOperation"));
  v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getCurrentKTPCSIdentity:error:", off_1002A39A8, &v16));
  v5 = v16;

  if (v4)
  {
    v6 = (void *)PCSIdentityCopyPublicKeyInfo(objc_msgSend(v4, "identity"));
    v7 = objc_alloc_init((Class)NSOperation);
    -[KTCheckIDSRegistrationOperation setFinishedOp:](self, "setFinishedOp:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTCheckIDSRegistrationOperation finishedOp](self, "finishedOp"));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v8);

    location = 0;
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTCheckIDSRegistrationOperation deps](self, "deps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsOperations"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10014A334;
    v12[3] = &unk_100247FF8;
    objc_copyWeak(&v14, &location);
    v11 = v6;
    v13 = v11;
    objc_msgSend(v10, "fetchKTRegistrationStatus:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  else
  {
    -[KTCheckIDSRegistrationOperation setCheckIDSError:](self, "setCheckIDSError:", 7);
  }

}

- (void)setCheckIDSError:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  -[KTCheckIDSRegistrationOperation setCheckIDSResult:](self, "setCheckIDSResult:");
  v8 = CFSTR("checkIDSError");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:underlyingError:userinfo:description:", kTransparencyErrorServer, -365, 0, v6, CFSTR("CheckIDS failed")));
  -[KTResultOperation setError:](self, "setError:", v7);

}

- (int64_t)checkIDSResult
{
  return self->_checkIDSResult;
}

- (void)setCheckIDSResult:(int64_t)a3
{
  self->_checkIDSResult = a3;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (KTCheckIDSRegistrationInterface)idsRegistrationInterface
{
  return (KTCheckIDSRegistrationInterface *)objc_loadWeakRetained((id *)&self->_idsRegistrationInterface);
}

- (void)setIdsRegistrationInterface:(id)a3
{
  objc_storeWeak((id *)&self->_idsRegistrationInterface, a3);
}

- (KTPCSOperationDependency)pcsOperation
{
  return (KTPCSOperationDependency *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPcsOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_pcsOperation, 0);
  objc_destroyWeak((id *)&self->_idsRegistrationInterface);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
}

@end
