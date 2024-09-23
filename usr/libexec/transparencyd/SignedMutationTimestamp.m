@implementation SignedMutationTimestamp

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  SignedMutationTimestamp *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(SignedMutationTimestamp);
  -[SignedObjectHolder setSignedObject:](v10, "setSignedObject:", v9);

  -[SignedObjectHolder setVerifier:](v10, "setVerifier:", v8);
  -[SignedObjectHolder setDataStore:](v10, "setDataStore:", v7);

  return v10;
}

+ (id)signedTypeWithObject:(id)a3
{
  return +[SignedMutationTimestamp signedTypeWithObject:verifier:dataStore:](SignedMutationTimestamp, "signedTypeWithObject:verifier:dataStore:", a3, 0, 0);
}

- (id)parsedMutationWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v5 = objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp mutation](self, "mutation"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp mutation](self, "mutation")),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp mutation](self, "mutation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IdsMutation parseFromData:error:](IdsMutation, "parseFromData:error:", v9, a3));

  }
  else
  {
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -4, CFSTR("SMT missing mutation")));
    if (qword_1002A7818 != -1)
      dispatch_once(&qword_1002A7818, &stru_100248330);
    v11 = qword_1002A7820;
    if (os_log_type_enabled((os_log_t)qword_1002A7820, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SMT missing mutation", v13, 2u);
    }
    v10 = 0;
  }
  return v10;
}

- (id)createManagedObject:(id)a3 uri:(id)a4 serverHint:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v29;
  uint8_t buf[4];
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp parsedMutationWithError:](self, "parsedMutationWithError:", a6));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder data](self, "data"));
    objc_msgSend(v13, "mutationMs");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signature](self, "signature"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "signingKeySpkihash"));
    v18 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v19 = v10;
    v20 = (void *)v18;
    v21 = v11;
    v22 = v19;
    v29 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "createMutation:application:uri:mutationMs:spkiHash:receiptTime:", v15));

    if (v23)
    {
      objc_msgSend(v23, "setReceiptServerHint:", v12);
      v24 = v23;
      v10 = v22;
      v11 = v29;
    }
    else
    {
      if (a6)
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorAlloc, -60, CFSTR("failed to create KTMutation entity")));
      v10 = v22;
      if (qword_1002A7818 != -1)
        dispatch_once(&qword_1002A7818, &stru_100248370);
      v11 = v29;
      v27 = qword_1002A7820;
      if (os_log_type_enabled((os_log_t)qword_1002A7820, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "failed to create KTMutation entity", buf, 2u);
      }
    }

  }
  else
  {
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -73, *a6));
    if (qword_1002A7818 != -1)
      dispatch_once(&qword_1002A7818, &stru_100248350);
    v25 = qword_1002A7820;
    if (os_log_type_enabled((os_log_t)qword_1002A7820, OS_LOG_TYPE_ERROR))
    {
      if (a6)
        v26 = *a6;
      else
        v26 = 0;
      *(_DWORD *)buf = 138412290;
      v31 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "mutation failed to parse: %@", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

- (id)diagnosticsJsonDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SignedMutationTimestamp;
  v3 = -[SignedObjectHolder diagnosticsJsonDictionary](&v10, "diagnosticsJsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp parsedMutationWithError:](self, "parsedMutationWithError:", 0));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "diagnosticsJsonDictionary"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("mutation"));

  }
  return v5;
}

- (unint64_t)verifyWithError:(id *)a3
{
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100150918;
  v10[3] = &unk_100247F30;
  v10[4] = self;
  v5 = objc_retainBlock(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp application](self, "application"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifySmtEvent"), v6));
  v8 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:validateType:error:block:", v7, 3, a3, v5);

  return (unint64_t)v8;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
}

@end
