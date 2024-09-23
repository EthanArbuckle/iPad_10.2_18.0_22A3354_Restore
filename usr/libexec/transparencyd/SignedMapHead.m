@implementation SignedMapHead

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  SignedMapHead *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(SignedMapHead);
  -[SignedObjectHolder setSignedObject:](v10, "setSignedObject:", v9);

  -[SignedObjectHolder setVerifier:](v10, "setVerifier:", v8);
  -[SignedObjectHolder setDataStore:](v10, "setDataStore:", v7);

  return v10;
}

+ (id)signedTypeWithObject:(id)a3
{
  return +[SignedMapHead signedTypeWithObject:verifier:dataStore:](SignedMapHead, "signedTypeWithObject:verifier:dataStore:", a3, 0, 0);
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
  v10.super_class = (Class)SignedMapHead;
  v3 = -[SignedObjectHolder diagnosticsJsonDictionary](&v10, "diagnosticsJsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "diagnosticsJsonDictionary"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("mapHead"));

  }
  return v5;
}

- (void)setOverrideBeginTimeFromLogEntry:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "hasSlh"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "slh"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parsedLogHead"));
    -[SignedMapHead setOverrideBeginTime:](self, "setOverrideBeginTime:", objc_msgSend(v6, "logBeginningMs"));

  }
}

- (id)copyManagedObject:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "application")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapHeadHash"));
  v11 = -[SignedMapHead overrideBeginTime](self, "overrideBeginTime");
  if (v11)
  {
    v12 = -[SignedMapHead overrideBeginTime](self, "overrideBeginTime");
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
    v12 = objc_msgSend(v18, "logBeginningMs");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v14 = (int)objc_msgSend(v13, "mapType");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchTreeHead:isMapHead:application:logBeginTime:logType:revision:error:", v10, 1, v7, v12, v14, objc_msgSend(v15, "revision"), a3));

  if (!v11)
  return v16;
}

- (id)createManagedObjectWithError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  id v20;
  unint64_t v21;
  void *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "application")));
  v6 = objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder data](self, "data"));
  v21 = -[SignedMapHead overrideBeginTime](self, "overrideBeginTime");
  v22 = (void *)v6;
  if (v21)
  {
    v20 = -[SignedMapHead overrideBeginTime](self, "overrideBeginTime");
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
    v20 = objc_msgSend(v19, "logBeginningMs");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapHeadHash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v12 = (int)objc_msgSend(v11, "mapType");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v14 = objc_msgSend(v13, "revision");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  LOWORD(v18) = objc_msgSend(v15, "populating");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "createMapHead:application:logBeginTime:logHeadHash:logType:revision:populating:gossip:", v8, v22, v20, v10, v12, v14, v18));

  if (!v21)
  return v16;
}

- (MapHead)parsedMapHead
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

  v3 = objc_claimAutoreleasedReturnValue(-[SignedMapHead mapHead](self, "mapHead"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead mapHead](self, "mapHead")),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead mapHead](self, "mapHead"));
    v13 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](MapHead, "parseFromData:error:", v7, &v13));
    v9 = v13;

    if (v9)
    {
      if (qword_1002A7B18 != -1)
        dispatch_once(&qword_1002A7B18, &stru_10024BDE0);
      v10 = qword_1002A7B20;
      if (os_log_type_enabled((os_log_t)qword_1002A7B20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to parse map head from SignedMapHead: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    if (qword_1002A7B18 != -1)
      dispatch_once(&qword_1002A7B18, &stru_10024BDC0);
    v11 = qword_1002A7B20;
    if (os_log_type_enabled((os_log_t)qword_1002A7B20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SMH missing map head", buf, 2u);
    }
    v8 = 0;
  }
  return (MapHead *)v8;
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
  v12[2] = sub_100195AB8;
  v12[3] = &unk_100247F30;
  v12[4] = self;
  v5 = objc_retainBlock(v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "application")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifySMHEvent"), v8));
  v10 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:validateType:error:block:", v9, 3, a3, v5);

  return (unint64_t)v10;
}

- (void)setMMDVerifiedForMapHead:(unint64_t)a3 mmdError:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001960D4;
  v9[3] = &unk_10023D2F0;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v9);

}

- (unint64_t)verifyMMD:(double)a3 error:(id *)a4
{
  _QWORD *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[6];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001963E4;
  v15[3] = &unk_10024BEA8;
  v15[4] = self;
  *(double *)&v15[5] = a3;
  v6 = objc_retainBlock(v15);
  v14 = 0;
  v7 = -[SignedMapHead verifyWithError:](self, "verifyWithError:", &v14);
  v8 = v14;
  +[TransparencyMapEntryVerifier storeSMHSignatureResult:smh:error:](TransparencyMapEntryVerifier, "storeSMHSignatureResult:smh:error:", v7, self, v8);
  if (a4 && v8)
    *a4 = objc_retainAutorelease(v8);
  if (v7 == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "application")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifySMHEvent"), v11));
    v7 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:error:block:", v12, a4, v6);

  }
  return (unint64_t)v7;
}

- (unint64_t)overrideBeginTime
{
  return self->_overrideBeginTime;
}

- (void)setOverrideBeginTime:(unint64_t)a3
{
  self->_overrideBeginTime = a3;
}

@end
