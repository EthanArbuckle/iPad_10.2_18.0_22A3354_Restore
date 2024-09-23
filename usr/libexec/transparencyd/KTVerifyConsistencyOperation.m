@implementation KTVerifyConsistencyOperation

- (KTVerifyConsistencyOperation)initWithDependencies:(id)a3 opId:(id)a4
{
  id v7;
  id v8;
  KTVerifyConsistencyOperation *v9;
  KTVerifyConsistencyOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)KTVerifyConsistencyOperation;
  v9 = -[KTGroupOperation init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deps, a3);
    -[KTVerifyConsistencyOperation setBackgroundOpId:](v10, "setBackgroundOpId:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTVerifyConsistencyOperation setErrors:](v10, "setErrors:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTVerifyConsistencyOperation setFailedRevs:](v10, "setFailedRevs:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTVerifyConsistencyOperation setServerHints:](v10, "setServerHints:", v13);

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("VerifyConsistency_FetchWaiter", v15);
    -[KTVerifyConsistencyOperation setFetchQueue:](v10, "setFetchQueue:", v16);

    -[KTGroupOperation setName:](v10, "setName:", CFSTR("Consistency"));
  }

  return v10;
}

- (void)groupStart
{
  NSObject *v3;
  dispatch_group_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;

  if (qword_1002A4410 != -1)
    dispatch_once(&qword_1002A4410, &stru_10023A288);
  v3 = qword_1002A4418;
  if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "VerifyConsistency: start", buf, 2u);
  }
  v4 = dispatch_group_create();
  -[KTVerifyConsistencyOperation setFetchGroup:](self, "setFetchGroup:", v4);

  v5 = objc_alloc_init((Class)NSOperation);
  -[KTVerifyConsistencyOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v26 = 0;
  LOBYTE(v6) = -[KTVerifyConsistencyOperation verifyConsistency:error:](self, "verifyConsistency:error:", kKTApplicationIdentifierIDS, &v26);
  v7 = v26;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (v7)
    {
      if (qword_1002A4410 != -1)
        dispatch_once(&qword_1002A4410, &stru_10023A2A8);
      v9 = qword_1002A4418;
      if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Verify IDS consistency failed: %@", buf, 0xCu);
      }
    }

    v8 = 0;
  }
  v25 = v8;
  v10 = -[KTVerifyConsistencyOperation verifyConsistency:error:](self, "verifyConsistency:error:", kKTApplicationIdentifierTLT, &v25);
  v11 = v25;

  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      if (qword_1002A4410 != -1)
        dispatch_once(&qword_1002A4410, &stru_10023A2C8);
      v12 = qword_1002A4418;
      if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Verify TLT consistency failed: %@", buf, 0xCu);
      }
    }

    v11 = 0;
  }
  v24 = v11;
  v13 = -[KTVerifyConsistencyOperation verifyConsistency:error:](self, "verifyConsistency:error:", kKTApplicationIdentifierIDSFaceTime, &v24);
  v14 = v24;

  if ((v13 & 1) == 0)
  {
    if (v14)
    {
      if (qword_1002A4410 != -1)
        dispatch_once(&qword_1002A4410, &stru_10023A2E8);
      v15 = qword_1002A4418;
      if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Verify FT consistency failed: %@", buf, 0xCu);
      }
    }

    v14 = 0;
  }
  v23 = v14;
  v16 = -[KTVerifyConsistencyOperation verifyConsistency:error:](self, "verifyConsistency:error:", kKTApplicationIdentifierIDSMultiplex, &v23);
  v17 = v23;

  if ((v16 & 1) == 0)
  {
    if (v17)
    {
      if (qword_1002A4410 != -1)
        dispatch_once(&qword_1002A4410, &stru_10023A308);
      v18 = qword_1002A4418;
      if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Verify MP consistency failed: %@", buf, 0xCu);
      }
    }

    v17 = 0;
  }
  if (qword_1002A4410 != -1)
    dispatch_once(&qword_1002A4410, &stru_10023A328);
  v19 = qword_1002A4418;
  if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "VerifyConsistency: waiting for fetches to finish validating", buf, 2u);
  }
  v20 = objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation fetchGroup](self, "fetchGroup"));
  v21 = objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation fetchQueue](self, "fetchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007068;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_group_notify(v20, v21, block);

}

- (BOOL)verifyConsistency:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  void *v39;
  uint64_t v40;
  unsigned __int8 v41;
  void *v43;
  id v44;
  void *v45;
  id *v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  uint8_t v55[128];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicKeyStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationPublicKeyStore:", v6));

  v10 = objc_msgSend(v9, "patLogBeginningMs");
  if (objc_msgSend(v6, "isEqual:", kKTApplicationIdentifierTLT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation deps](self, "deps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publicKeyStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tltKeyStore"));

    v10 = objc_msgSend(v13, "tltLogBeginningMs");
    v9 = v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation deps](self, "deps"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataStore"));
  v54 = 0;
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "latestConsistencyVerifiedTreeHeadRevision:logBeginMs:error:", v6, v10, &v54));
  v17 = v54;

  v47 = (void *)v16;
  if (v16)
  {
    v46 = a4;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dataStore"));
    v53 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "unverifiedRevisions:isMapHead:inclusion:logBeginMs:error:", v6, 0, 0, v10, &v53));
    v21 = v53;

    if (v20 && objc_msgSend(v20, "count"))
    {
      v22 = objc_msgSend(v20, "mutableCopy");
      v45 = v9;
      if (objc_msgSend(v22, "count")
        && (!objc_msgSend(v22, "containsObject:", v47) || (unint64_t)objc_msgSend(v22, "count") > 1))
      {
        objc_msgSend(v22, "sortUsingSelector:", "compare:");
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation deps](self, "deps"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "logClient"));
        v44 = v22;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext chunkArray:chunkSize:](KTContext, "chunkArray:chunkSize:", v22, objc_msgSend(v28, "consistencyMaxProofs")));

        if (qword_1002A4410 != -1)
          dispatch_once(&qword_1002A4410, &stru_10023A410);
        v43 = v20;
        v30 = (void *)qword_1002A4418;
        if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_DEFAULT))
        {
          v31 = v30;
          v32 = objc_msgSend(v29, "count");
          *(_DWORD *)buf = 138543874;
          v57 = v6;
          v58 = 2114;
          v59 = v22;
          v60 = 2048;
          v61 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "fetching consistency proof for %{public}@ %{public}@ in %lu chunks", buf, 0x20u);

        }
        v33 = v6;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v34 = v29;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v50;
          v24 = 1;
          do
          {
            for (i = 0; i != v36; i = (char *)i + 1)
            {
              v39 = v21;
              if (*(_QWORD *)v50 != v37)
                objc_enumerationMutation(v34);
              v40 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
              v48 = v21;
              v41 = -[KTVerifyConsistencyOperation downloadConsistencyProofRequest:lastVerifiedRevision:application:error:](self, "downloadConsistencyProofRequest:lastVerifiedRevision:application:error:", v40, v47, v33, &v48, v43);
              v21 = v48;

              if ((v41 & 1) == 0)
              {
                v24 = 0;
                if (v46)
                {
                  if (v21)
                  {
                    v24 = 0;
                    *v46 = objc_retainAutorelease(v21);
                  }
                }
              }
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
          }
          while (v36);
        }
        else
        {
          v24 = 1;
        }

        v6 = v33;
        v20 = v43;
        v22 = v44;
      }
      else
      {
        if (qword_1002A4410 != -1)
          dispatch_once(&qword_1002A4410, &stru_10023A3F0);
        v23 = qword_1002A4418;
        v24 = 1;
        if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Skipping consistency proof request -- only one revision", buf, 2u);
        }
      }

      v9 = v45;
    }
    else if (v21)
    {
      if (qword_1002A4410 != -1)
        dispatch_once(&qword_1002A4410, &stru_10023A3D0);
      v25 = qword_1002A4418;
      if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v57 = v6;
        v58 = 2112;
        v59 = v21;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "failed to get consistency unverified STH revisions for %{public}@: %@", buf, 0x16u);
      }
      if (v46)
      {
        v21 = objc_retainAutorelease(v21);
        v24 = 0;
        *v46 = v21;
      }
      else
      {
        v24 = 0;
      }
    }
    else
    {
      v24 = 1;
    }

    v17 = v21;
  }
  else
  {
    if (!v17)
      goto LABEL_27;
    if (qword_1002A4410 != -1)
      dispatch_once(&qword_1002A4410, &stru_10023A3B0);
    v26 = qword_1002A4418;
    if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v57 = v6;
      v58 = 2112;
      v59 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "failed to get latest verified STH revision for %{public}@: %@", buf, 0x16u);
    }
    if (a4)
    {
      v17 = objc_retainAutorelease(v17);
      v24 = 0;
      *a4 = v17;
    }
    else
    {
LABEL_27:
      v24 = 0;
    }
  }

  return v24 & 1;
}

- (BOOL)downloadConsistencyProofRequest:(id)a3 lastVerifiedRevision:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t *v29;
  id v30;
  id location;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t *v37;
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));
  if ((objc_msgSend(v13, "containsObject:", v11) & 1) == 0)
  {
    objc_msgSend(v13, "addObject:", v11);
    objc_msgSend(v13, "sortUsingSelector:", "compare:");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyRPCRequestBuilder buildConsistencyProofRequest:revisions:error:](TransparencyRPCRequestBuilder, "buildConsistencyProofRequest:revisions:error:", v12, v13, a6));
  v25 = v10;
  if (v14)
  {
    *(_QWORD *)buf = 0;
    v39 = buf;
    v40 = 0x3032000000;
    v41 = sub_100008030;
    v42 = sub_100008040;
    v43 = 0;
    v15 = objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation fetchGroup](self, "fetchGroup", v10));
    dispatch_group_enter(v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation deps](self, "deps"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataStore"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100008048;
    v32[3] = &unk_10023A478;
    v32[4] = self;
    v18 = v12;
    v33 = v18;
    v34 = v11;
    v35 = v10;
    v19 = v13;
    v36 = v19;
    v37 = buf;
    objc_msgSend(v17, "performBlockAndWaitWithMoc:", v32);

    location = 0;
    objc_initWeak(&location, self);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyConsistencyOperation deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "logClient"));
    v22 = *((_QWORD *)v39 + 5);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100008298;
    v26[3] = &unk_10023A568;
    objc_copyWeak(&v30, &location);
    v27 = v18;
    v29 = buf;
    v28 = v19;
    objc_msgSend(v21, "fetchConsistencyProof:uuid:completionHandler:", v14, v22, v26);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (qword_1002A4410 != -1)
      dispatch_once(&qword_1002A4410, &stru_10023A430);
    v23 = qword_1002A4418;
    if (os_log_type_enabled((os_log_t)qword_1002A4418, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to create consistency proof request", buf, 2u);
    }
  }

  return v14 != 0;
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

- (OS_dispatch_group)fetchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFetchGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (OS_dispatch_queue)fetchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFetchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableDictionary)errors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSMutableDictionary)failedRevs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFailedRevs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSMutableDictionary)serverHints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setServerHints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHints, 0);
  objc_storeStrong((id *)&self->_failedRevs, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_backgroundOpId, 0);
  objc_storeStrong((id *)&self->_deps, 0);
}

@end
