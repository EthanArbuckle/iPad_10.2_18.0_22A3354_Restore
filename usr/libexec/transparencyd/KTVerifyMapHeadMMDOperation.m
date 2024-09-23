@implementation KTVerifyMapHeadMMDOperation

- (KTVerifyMapHeadMMDOperation)initWithDependencies:(id)a3 opId:(id)a4
{
  id v7;
  id v8;
  KTVerifyMapHeadMMDOperation *v9;
  KTVerifyMapHeadMMDOperation *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KTVerifyMapHeadMMDOperation;
  v9 = -[KTGroupOperation init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deps, a3);
    -[KTVerifyMapHeadMMDOperation setBackgroundOpId:](v10, "setBackgroundOpId:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTVerifyMapHeadMMDOperation setErrors:](v10, "setErrors:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTVerifyMapHeadMMDOperation setFailedSMHs:](v10, "setFailedSMHs:", v12);

    -[KTGroupOperation setName:](v10, "setName:", CFSTR("SmhMMD"));
  }

  return v10;
}

- (void)groupStart
{
  NSObject *v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  NSObject *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *i;
  uint64_t v28;
  KTVerifyMapHeadMMDOperation *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  void *v37;
  void *v38;
  KTVerifyMapHeadMMDOperation *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id obj;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _QWORD v63[2];
  _QWORD v64[2];
  uint8_t buf[4];
  id v66;

  if (qword_1002A4560 != -1)
    dispatch_once(&qword_1002A4560, &stru_10023CBB8);
  v3 = qword_1002A4568;
  if (os_log_type_enabled((os_log_t)qword_1002A4568, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "VerifyMapHeadMMD: start", buf, 2u);
  }
  v60 = 0;
  v4 = -[KTVerifyMapHeadMMDOperation handlePendingMapHeadMMDs:error:](self, "handlePendingMapHeadMMDs:error:", kKTApplicationIdentifierIDS, &v60);
  v5 = v60;
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    if (v5)
    {
      if (qword_1002A4560 != -1)
        dispatch_once(&qword_1002A4560, &stru_10023CBD8);
      v7 = qword_1002A4568;
      if (os_log_type_enabled((os_log_t)qword_1002A4568, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Verify IDS Map Head MMDs failed: %@", buf, 0xCu);
      }
    }
    -[KTResultOperation setError:](self, "setError:", v6);
  }
  v59 = v6;
  v8 = -[KTVerifyMapHeadMMDOperation handlePendingMapHeadMMDs:error:](self, "handlePendingMapHeadMMDs:error:", kKTApplicationIdentifierIDSMultiplex, &v59);
  v9 = v59;

  if ((v8 & 1) == 0)
  {
    if (v9)
    {
      if (qword_1002A4560 != -1)
        dispatch_once(&qword_1002A4560, &stru_10023CBF8);
      v10 = qword_1002A4568;
      if (os_log_type_enabled((os_log_t)qword_1002A4568, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Verify MP Map Head MMDs failed: %@", buf, 0xCu);
      }
    }

    v9 = 0;
  }
  v58 = v9;
  v11 = -[KTVerifyMapHeadMMDOperation handlePendingMapHeadMMDs:error:](self, "handlePendingMapHeadMMDs:error:", kKTApplicationIdentifierIDSFaceTime, &v58);
  v12 = v58;

  if ((v11 & 1) == 0)
  {
    if (v12)
    {
      if (qword_1002A4560 != -1)
        dispatch_once(&qword_1002A4560, &stru_10023CC18);
      v13 = qword_1002A4568;
      if (os_log_type_enabled((os_log_t)qword_1002A4568, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Verify FT Map Head MMDs failed: %@", buf, 0xCu);
      }
    }

    v12 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation errors](self, "errors"));
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v47 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation errors](self, "errors"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));

    v46 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", CFSTR(",")));
    v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SMH MMDs failed for applications: %@"), v18));

    v63[0] = NSMultipleUnderlyingErrorsKey;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation errors](self, "errors"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allValues"));
    v63[1] = NSLocalizedDescriptionKey;
    v64[0] = v21;
    v45 = (void *)v19;
    v64[1] = v19;
    v22 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 2));

    v44 = (void *)v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TransparencyErrorVerify"), -383, v22));
    -[KTResultOperation setError:](self, "setError:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation failedSMHs](self, "failedSMHs"));
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v25)
    {
      v26 = v25;
      v49 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v49)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v24, "appendFormat:", CFSTR("%@:"), v28);
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v29 = self;
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation failedSMHs](self, "failedSMHs"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v28));

          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v51;
            do
            {
              for (j = 0; j != v33; j = (char *)j + 1)
              {
                if (*(_QWORD *)v51 != v34)
                  objc_enumerationMutation(v31);
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j), "base64EncodedStringWithOptions:", 0));
                objc_msgSend(v24, "appendFormat:", CFSTR("%@;"), v36);

              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
            }
            while (v33);
          }

          self = v29;
        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v26);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation backgroundOpId](self, "backgroundOpId"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](self, "deps"));
    v39 = self;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "smDataStore"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation name](v39, "name"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](v39, "error"));
    +[KTBackgroundSystemValidationOperation addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:](KTBackgroundSystemValidationOperation, "addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:", v37, v40, v24, v41, 0, v42);

    v12 = v47;
  }
  if (qword_1002A4560 != -1)
    dispatch_once(&qword_1002A4560, &stru_10023CC38);
  v43 = qword_1002A4568;
  if (os_log_type_enabled((os_log_t)qword_1002A4568, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "VerifyMapHeadMMD: end", buf, 2u);
  }

}

- (BOOL)handlePendingMapHeadMMDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10002B77C;
  v21 = sub_10002B78C;
  v22 = 0;
  location = 0;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataStore"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002B794;
  v12[3] = &unk_10023CC80;
  objc_copyWeak(&v15, &location);
  v9 = v6;
  v13 = v9;
  v14 = &v17;
  objc_msgSend(v8, "performForSMHsWithUnverifiedMMD:error:block:", v9, a4, v12);

  if (a4)
  {
    v10 = (void *)v18[5];
    if (v10)
      *a4 = objc_retainAutorelease(v10);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

  return 0;
}

- (id)verifyMapHeadMMDs:(id)a3 application:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id *v42;
  void *v43;
  id obj;
  void *v45;
  void *v46;
  uint64_t v47;
  KTVerifyMapHeadMMDOperation *v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  NSErrorUserInfoKey v56;
  void *v57;
  uint8_t buf[4];
  id v59;
  _BYTE v60[128];

  v42 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v48 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publicKeyStore"));
  v43 = v8;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationPublicKeyStore:", v8));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v12)
  {
    v13 = v12;
    v47 = *(_QWORD *)v53;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v53 != v47)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v14);
        v16 = objc_autoreleasePoolPush();
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sth"));
        v51 = 0;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[SignedObjectHolder parseFromData:error:](SignedMapHead, "parseFromData:error:", v17, &v51));
        v19 = v51;

        if (v18)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "appSthKeyStore"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "signatureVerifier"));
          objc_msgSend(v18, "setVerifier:", v21);

          objc_msgSend(v15, "receiptTime");
          v50 = v19;
          v22 = objc_msgSend(v18, "verifyMMD:error:", &v50);
          v23 = v50;

          objc_msgSend(v15, "setUnsigned:value:", "mmdVerified", v22);
          if (!v22)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sth"));
            objc_msgSend(v45, "addObject:", v24);

            objc_msgSend(v9, "addObject:", v23);
          }
          v25 = v9;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](v48, "deps", v42));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dataStore"));
          v49 = v23;
          v28 = objc_msgSend(v27, "persistAndRefaultObject:error:", v15, &v49);
          v19 = v49;

          if ((v28 & 1) != 0)
            goto LABEL_16;
          if (qword_1002A4560 != -1)
            dispatch_once(&qword_1002A4560, &stru_10023CCA0);
          v29 = qword_1002A4568;
          if (os_log_type_enabled((os_log_t)qword_1002A4568, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v19;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "VerifyMapHeadMMD: failed to save MMD verified SMHs: %@", buf, 0xCu);
          }
          if (!v19)
          {
LABEL_16:
            v9 = v25;
            goto LABEL_19;
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](v48, "deps"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dataStore"));
          objc_msgSend(v31, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("verifyMapHeadMMDs"), v19);

          v9 = v25;
          v32 = v25;
        }
        else
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sth"));
          objc_msgSend(v45, "addObject:", v33);

          v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyMapHeadMMDOperation deps](v48, "deps"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "dataStore"));
          objc_msgSend(v35, "deleteObject:", v15);

          v32 = v9;
        }
        objc_msgSend(v32, "addObject:", v19, v42);
LABEL_19:

        objc_autoreleasePoolPop(v16);
        v14 = (char *)v14 + 1;
      }
      while (v13 != v14);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v9, "count"))
  {
    v56 = NSMultipleUnderlyingErrorsKey;
    v57 = v9;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TransparencyErrorVerify"), -383, v36));
    v38 = v37;
    if (v42 && v37)
      *v42 = objc_retainAutorelease(v37);

  }
  if (objc_msgSend(v45, "count", v42))
    v39 = v45;
  else
    v39 = 0;
  v40 = v39;

  return v40;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSUUID)backgroundOpId
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBackgroundOpId:(id)a3
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

- (NSMutableDictionary)errors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSMutableDictionary)failedSMHs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFailedSMHs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedSMHs, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_backgroundOpId, 0);
  objc_storeStrong((id *)&self->_deps, 0);
}

@end
