@implementation KTGarbageCollectDBOperation

- (KTGarbageCollectDBOperation)initWithDependencies:(id)a3
{
  id v5;
  KTGarbageCollectDBOperation *v6;
  KTGarbageCollectDBOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTGarbageCollectDBOperation;
  v6 = -[KTGroupOperation init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deps, a3);

  return v7;
}

- (void)garbageCollectHeads:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicKeyStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationPublicKeyStore:", v6));

  v10 = objc_msgSend(v9, "patLogBeginningMs");
  v11 = kKTApplicationIdentifierTLT;
  if (objc_msgSend(v6, "isEqual:", kKTApplicationIdentifierTLT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "publicKeyStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tltKeyStore"));

    v10 = objc_msgSend(v14, "tltLogBeginningMs");
    v9 = v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)-kKTMaximumSTHLifetime));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataStore"));
  objc_msgSend(v17, "garbageCollectSTHs:logBeginMs:olderThanDate:error:", v6, v10, v15, a4);

  if ((objc_msgSend(v6, "isEqual:", v11) & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dataStore"));
    v20 = objc_msgSend(v19, "newestMapRevision:logBeginMs:error:", v6, objc_msgSend(v9, "patLogBeginningMs"), a4);

    if (a4 && *a4)
    {
      if (qword_1002A4490 != -1)
        dispatch_once(&qword_1002A4490, &stru_10023B470);
      v21 = qword_1002A4498;
      if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
      {
        v22 = *a4;
        v26 = 138412546;
        v27 = v6;
        v28 = 2112;
        v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "garbageCollectHeads failed to get newest map revision for %@: %@", (uint8_t *)&v26, 0x16u);
      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)-kKTMaximumSMHLifetime));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dataStore"));
    objc_msgSend(v25, "garbageCollectSMHs:logBeginMs:olderThanRevision:olderThanDate:error:", v6, objc_msgSend(v9, "patLogBeginningMs"), v20, v23, a4);

  }
}

- (void)groupStart
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;

  if (qword_1002A4490 != -1)
    dispatch_once(&qword_1002A4490, &stru_10023B490);
  v3 = qword_1002A4498;
  if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "GarbageCollectDB: start", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataStore"));
  v54 = 0;
  objc_msgSend(v5, "garbageCollectVerifications:", &v54);
  v6 = v54;

  if (v6)
  {
    if (qword_1002A4490 != -1)
      dispatch_once(&qword_1002A4490, &stru_10023B4B0);
    v7 = qword_1002A4498;
    if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "garbageCollectVerifications: %@", buf, 0xCu);
    }

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataStore"));
  v53 = 0;
  objc_msgSend(v9, "garbageCollectServerRPCs:", &v53);
  v10 = v53;

  if (v10)
  {
    if (qword_1002A4490 != -1)
      dispatch_once(&qword_1002A4490, &stru_10023B4D0);
    v11 = qword_1002A4498;
    if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "garbageCollectServerRPCs: %@", buf, 0xCu);
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataStore"));
  v52 = 0;
  objc_msgSend(v13, "garbageCollectSMTs:", &v52);
  v14 = v52;

  if (v14)
  {
    if (qword_1002A4490 != -1)
      dispatch_once(&qword_1002A4490, &stru_10023B4F0);
    v15 = qword_1002A4498;
    if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "garbageCollectSMTs: %@", buf, 0xCu);
    }

  }
  v16 = kKTApplicationIdentifierIDS;
  v51 = 0;
  -[KTGarbageCollectDBOperation garbageCollectHeads:error:](self, "garbageCollectHeads:error:", kKTApplicationIdentifierIDS, &v51);
  v17 = v51;
  if (v17)
  {
    v18 = v17;
    if (qword_1002A4490 != -1)
      dispatch_once(&qword_1002A4490, &stru_10023B510);
    v19 = qword_1002A4498;
    if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "garbageCollectIDSHeads: %@", buf, 0xCu);
    }

  }
  v50 = 0;
  -[KTGarbageCollectDBOperation garbageCollectHeads:error:](self, "garbageCollectHeads:error:", kKTApplicationIdentifierTLT, &v50);
  v20 = v50;
  if (v20)
  {
    v21 = v20;
    if (qword_1002A4490 != -1)
      dispatch_once(&qword_1002A4490, &stru_10023B530);
    v22 = qword_1002A4498;
    if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "garbageCollectTLTHeads: %@", buf, 0xCu);
    }

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(-2 * kKTMaximumCompletedRequestLifetime)));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dataStore"));
  v49 = 0;
  objc_msgSend(v25, "garbageCollectRequests:olderThan:error:", v16, v23, &v49);
  v26 = v49;

  if (v26)
  {
    if (qword_1002A4490 != -1)
      dispatch_once(&qword_1002A4490, &stru_10023B550);
    v27 = qword_1002A4498;
    if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "garbageCollectIDSRequests: %@", buf, 0xCu);
    }

  }
  v28 = kKTApplicationIdentifierIDSMultiplex;
  v48 = 0;
  -[KTGarbageCollectDBOperation garbageCollectHeads:error:](self, "garbageCollectHeads:error:", kKTApplicationIdentifierIDSMultiplex, &v48);
  v29 = v48;
  if (v29)
  {
    v30 = v29;
    if (qword_1002A4490 != -1)
      dispatch_once(&qword_1002A4490, &stru_10023B570);
    v31 = qword_1002A4498;
    if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v30;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "garbageCollectMPHeads: %@", buf, 0xCu);
    }

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "dataStore"));
  v47 = 0;
  objc_msgSend(v33, "garbageCollectRequests:olderThan:error:", v28, v23, &v47);
  v34 = v47;

  if (v34)
  {
    if (qword_1002A4490 != -1)
      dispatch_once(&qword_1002A4490, &stru_10023B590);
    v35 = qword_1002A4498;
    if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "garbageCollectMPRequests: %@", buf, 0xCu);
    }

  }
  v36 = kKTApplicationIdentifierIDSFaceTime;
  v46 = 0;
  -[KTGarbageCollectDBOperation garbageCollectHeads:error:](self, "garbageCollectHeads:error:", kKTApplicationIdentifierIDSFaceTime, &v46);
  v37 = v46;
  if (v37)
  {
    v38 = v37;
    if (qword_1002A4490 != -1)
      dispatch_once(&qword_1002A4490, &stru_10023B5B0);
    v39 = qword_1002A4498;
    if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v38;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "garbageCollectFTHeads: %@", buf, 0xCu);
    }

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTGarbageCollectDBOperation deps](self, "deps"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "dataStore"));
  v45 = 0;
  objc_msgSend(v41, "garbageCollectRequests:olderThan:error:", v36, v23, &v45);
  v42 = v45;

  if (v42)
  {
    if (qword_1002A4490 != -1)
      dispatch_once(&qword_1002A4490, &stru_10023B5D0);
    v43 = qword_1002A4498;
    if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v42;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "garbageCollectFTRequests: %@", buf, 0xCu);
    }

  }
  if (qword_1002A4490 != -1)
    dispatch_once(&qword_1002A4490, &stru_10023B5F0);
  v44 = qword_1002A4498;
  if (os_log_type_enabled((os_log_t)qword_1002A4498, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "GarbageCollectDB: end", buf, 2u);
  }

}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deps, 0);
}

@end
