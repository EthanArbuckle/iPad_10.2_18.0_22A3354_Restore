@implementation TransparencyPatInclusionProofVerifier

- (TransparencyPatInclusionProofVerifier)initWithKeyBag:(id)a3 application:(id)a4
{
  id v7;
  id v8;
  TransparencyPatInclusionProofVerifier *v9;
  TransparencyPatInclusionProofVerifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyPatInclusionProofVerifier;
  v9 = -[TransparencyPatInclusionProofVerifier init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyBag, a3);
    objc_storeStrong((id *)&v10->_application, a4);
  }

  return v10;
}

- (unint64_t)verifyPatInclusionProofWithPerAppLogEntry:(id)a3 topLevelTreeEntry:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001484E0;
  v18[3] = &unk_100247F30;
  v10 = v8;
  v19 = v10;
  v11 = objc_retainBlock(v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPatInclusionProofVerifier application](self, "application"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifyPATInclusionProofEvent"), v12));
  v14 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:validateType:error:block:", v13, 3, a5, v11);

  if (v14 == (id)1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "slh"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v15));

    v14 = objc_msgSend(v9, "verifyTLTEntryForPerApplicationLogHead:error:", v16, a5);
  }

  return (unint64_t)v14;
}

- (TransparencyPublicKeyBag)keyBag
{
  return (TransparencyPublicKeyBag *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_keyBag, 0);
}

- (TransparencyPatInclusionProofVerifier)initWithKeyStore:(id)a3 application:(id)a4
{
  id v6;
  void *v7;
  TransparencyPatInclusionProofVerifier *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "keyBag"));
  v8 = -[TransparencyPatInclusionProofVerifier initWithKeyBag:application:](self, "initWithKeyBag:application:", v7, v6);

  return v8;
}

@end
