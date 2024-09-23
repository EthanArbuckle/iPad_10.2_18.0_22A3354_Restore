@implementation SignedLogHead

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  SignedLogHead *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(SignedLogHead);
  -[SignedObjectHolder setSignedObject:](v10, "setSignedObject:", v9);

  -[SignedObjectHolder setVerifier:](v10, "setVerifier:", v8);
  -[SignedObjectHolder setDataStore:](v10, "setDataStore:", v7);

  return v10;
}

+ (id)signedTypeWithObject:(id)a3
{
  return +[SignedLogHead signedTypeWithObject:verifier:dataStore:](SignedLogHead, "signedTypeWithObject:verifier:dataStore:", a3, 0, 0);
}

- (id)diagnosticsJsonDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SignedLogHead;
  v3 = -[SignedObjectHolder diagnosticsJsonDictionary](&v9, "diagnosticsJsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "diagnosticsJsonDictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("logHead"));

  return v5;
}

- (LogHead)parsedLogHead
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;

  v3 = objc_claimAutoreleasedReturnValue(-[SignedLogHead logHead](self, "logHead"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead logHead](self, "logHead")),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead logHead](self, "logHead"));
    v13 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](LogHead, "parseFromData:error:", v7, &v13));
    v9 = v13;

    if (v9)
    {
      if (qword_10012A7A8 != -1)
        dispatch_once(&qword_10012A7A8, &stru_1001064E0);
      v10 = qword_10012A7B0;
      if (os_log_type_enabled((os_log_t)qword_10012A7B0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to parse log head from Signed Log Head: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    if (qword_10012A7A8 != -1)
      dispatch_once(&qword_10012A7A8, &stru_1001064C0);
    v11 = qword_10012A7B0;
    if (os_log_type_enabled((os_log_t)qword_10012A7B0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SLH missing log head", buf, 2u);
    }
    v8 = 0;
  }
  return (LogHead *)v8;
}

- (id)copyManagedObject:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "application")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logHeadHash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v12 = objc_msgSend(v11, "logBeginningMs");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v14 = (int)objc_msgSend(v13, "logType");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchTreeHead:isMapHead:application:logBeginTime:logType:revision:error:", v10, 0, v7, v12, v14, objc_msgSend(v15, "revision"), a3));

  return v16;
}

- (id)createManagedObjectWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  id v18;
  void *v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "application")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder data](self, "data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v18 = objc_msgSend(v8, "logBeginningMs");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logHeadHash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v12 = (int)objc_msgSend(v11, "logType");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v14 = objc_msgSend(v13, "revision");
  LOBYTE(v17) = -[SignedLogHead gossip](self, "gossip");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "createTreeHead:isMapHead:application:logBeginTime:logHeadHash:logType:revision:gossip:", v7, 0, v19, v18, v10, v12, v14, v17));

  return v15;
}

- (void)storeSignatureResult:(unint64_t)a3 signatureError:(id *)a4
{
  void *v7;
  _QWORD v8[7];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011BD8;
  v8[3] = &unk_100106528;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  objc_msgSend(v7, "performBlockAndWait:", v8);

}

- (unint64_t)verifyWithError:(id *)a3
{
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011F64;
  v12[3] = &unk_100105E28;
  v12[4] = self;
  v5 = objc_retainBlock(v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "application")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifySTHEvent"), v8));
  v10 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:validateType:error:block:", v9, 3, a3, v5);

  return (unint64_t)v10;
}

- (BOOL)gossip
{
  return self->_gossip;
}

- (void)setGossip:(BOOL)a3
{
  self->_gossip = a3;
}

@end
