@implementation TransparencyMapInclusionProofVerifier

- (TransparencyMapInclusionProofVerifier)initWithKeyBag:(id)a3 application:(id)a4
{
  id v7;
  id v8;
  TransparencyMapInclusionProofVerifier *v9;
  TransparencyMapInclusionProofVerifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyMapInclusionProofVerifier;
  v9 = -[TransparencyMapInclusionProofVerifier init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyBag, a3);
    objc_storeStrong((id *)&v10->_application, a4);
  }

  return v10;
}

- (void)setInclusionResult:(unint64_t)a3 mapHead:(id)a4 failure:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataStore"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000097F8;
  v12[3] = &unk_100105D38;
  v14 = v8;
  v15 = a3;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v12);

}

- (unint64_t)verifyPerApplicationTreeEntry:(id)a3 mapHead:(id)a4 topLevelTreeEntry:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  TransparencyMapInclusionProofVerifier *v26;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100009CD8;
    v23[3] = &unk_100105DE0;
    v13 = v10;
    v24 = v13;
    v25 = v11;
    v26 = self;
    v14 = objc_retainBlock(v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyMapInclusionProofVerifier application](self, "application"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifyPATInclusionProofEvent"), v15));
    v17 = (unint64_t)+[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:validateType:error:block:", v16, 3, a6, v14);

    if (v17 == 1)
    {
      if (v12)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "slh"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v18));

        v17 = (unint64_t)objc_msgSend(v12, "verifyTLTEntryForPerApplicationLogHead:error:", v19, a6);
      }
      else
      {
        if (qword_10012A758 != -1)
          dispatch_once(&qword_10012A758, &stru_100105E00);
        v21 = qword_10012A760;
        v17 = 1;
        if (os_log_type_enabled((os_log_t)qword_10012A760, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v17 = 1;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "failed to get TLT inclusion proof for PAT head; deferring inclusion verification",
            buf,
            2u);
        }
      }
    }

  }
  else
  {
    if (qword_10012A758 != -1)
      dispatch_once(&qword_10012A758, &stru_100105D58);
    v20 = qword_10012A760;
    if (os_log_type_enabled((os_log_t)qword_10012A760, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "failed to get PAT inclusion proof for PAM head; deferring inclusion verification",
        buf,
        2u);
    }
    -[TransparencyMapInclusionProofVerifier setInclusionResult:mapHead:failure:](self, "setInclusionResult:mapHead:failure:", 2, v11, 0);
    v17 = 1;
  }

  return v17;
}

- (unint64_t)verifyInclusionProofWithMapEntry:(id)a3 perAppLogEntry:(id)a4 topLevelTreeEntry:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000A494;
  v27[3] = &unk_100105E28;
  v13 = v10;
  v28 = v13;
  v14 = objc_retainBlock(v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyMapInclusionProofVerifier application](self, "application"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifyMapInclusionProofEvent"), v15));
  v17 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:validateType:error:block:", v16, 3, a6, v14);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "smh"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMapHead signedTypeWithObject:](SignedMapHead, "signedTypeWithObject:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataStore"));
  objc_msgSend(v19, "setDataStore:", v20);

  if (v11)
  {
    objc_msgSend(v19, "setOverrideBeginTimeFromLogEntry:", v11);
  }
  else
  {
    v26 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metadata"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("overrideLogBeginTime")));
    v23 = objc_msgSend(v22, "longLongValue");

    if (v23)
    {
      objc_msgSend(v19, "setOverrideBeginTime:", v23);
      v12 = v26;
    }
    else
    {
      if (qword_10012A758 != -1)
        dispatch_once(&qword_10012A758, &stru_100105E48);
      v12 = v26;
      v24 = qword_10012A760;
      if (os_log_type_enabled((os_log_t)qword_10012A760, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "verifyInclusionProofWithMapEntry couldn't find an override time despite needing one. This SMH will leak to long-term gc: %@", buf, 0xCu);
      }
    }
  }
  if (v17 == (id)1)
    v17 = -[TransparencyMapInclusionProofVerifier verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:](self, "verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:", v11, v19, v12, a6);

  return (unint64_t)v17;
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

@end
