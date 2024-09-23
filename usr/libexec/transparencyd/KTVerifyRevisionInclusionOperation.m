@implementation KTVerifyRevisionInclusionOperation

- (KTVerifyRevisionInclusionOperation)initWithDependencies:(id)a3 opId:(id)a4
{
  id v7;
  id v8;
  KTVerifyRevisionInclusionOperation *v9;
  KTVerifyRevisionInclusionOperation *v10;
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
  v18.super_class = (Class)KTVerifyRevisionInclusionOperation;
  v9 = -[KTGroupOperation init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deps, a3);
    -[KTVerifyRevisionInclusionOperation setBackgroundOpId:](v10, "setBackgroundOpId:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTVerifyRevisionInclusionOperation setErrors:](v10, "setErrors:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTVerifyRevisionInclusionOperation setFailedRevs:](v10, "setFailedRevs:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTVerifyRevisionInclusionOperation setServerHints:](v10, "setServerHints:", v13);

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("VerifyInclusion_FetchWaiter", v15);
    -[KTVerifyRevisionInclusionOperation setFetchQueue:](v10, "setFetchQueue:", v16);

    -[KTGroupOperation setName:](v10, "setName:", CFSTR("RevInclusion"));
  }

  return v10;
}

- (void)groupStart
{
  NSObject *v3;
  dispatch_group_t v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;

  if (qword_1002A45C0 != -1)
    dispatch_once(&qword_1002A45C0, &stru_10023E4C0);
  v3 = qword_1002A45C8;
  if (os_log_type_enabled((os_log_t)qword_1002A45C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "VerifyRevisionInclusion: start", buf, 2u);
  }
  v4 = dispatch_group_create();
  -[KTVerifyRevisionInclusionOperation setFetchGroup:](self, "setFetchGroup:", v4);

  v5 = objc_alloc_init((Class)NSOperation);
  -[KTVerifyRevisionInclusionOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v22 = 0;
  v7 = -[KTVerifyRevisionInclusionOperation verifyInclusion:error:](self, "verifyInclusion:error:", kKTApplicationIdentifierIDS, &v22);
  v8 = v22;
  if ((v7 & 1) == 0)
  {
    if (qword_1002A45C0 != -1)
      dispatch_once(&qword_1002A45C0, &stru_10023E4E0);
    v9 = qword_1002A45C8;
    if (os_log_type_enabled((os_log_t)qword_1002A45C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Verify IDS revision inclusion failed: %@", buf, 0xCu);
    }

    v8 = 0;
  }
  v21 = v8;
  v10 = -[KTVerifyRevisionInclusionOperation verifyInclusion:error:](self, "verifyInclusion:error:", kKTApplicationIdentifierIDSFaceTime, &v21);
  v11 = v21;

  if ((v10 & 1) == 0)
  {
    if (qword_1002A45C0 != -1)
      dispatch_once(&qword_1002A45C0, &stru_10023E500);
    v12 = qword_1002A45C8;
    if (os_log_type_enabled((os_log_t)qword_1002A45C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Verify FT revision inclusion failed: %@", buf, 0xCu);
    }

    v11 = 0;
  }
  v20 = v11;
  v13 = -[KTVerifyRevisionInclusionOperation verifyInclusion:error:](self, "verifyInclusion:error:", kKTApplicationIdentifierIDSMultiplex, &v20);
  v14 = v20;

  if ((v13 & 1) == 0)
  {
    if (qword_1002A45C0 != -1)
      dispatch_once(&qword_1002A45C0, &stru_10023E520);
    v15 = qword_1002A45C8;
    if (os_log_type_enabled((os_log_t)qword_1002A45C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Verify MP revision inclusion failed: %@", buf, 0xCu);
    }

    v14 = 0;
  }
  if (qword_1002A45C0 != -1)
    dispatch_once(&qword_1002A45C0, &stru_10023E540);
  v16 = qword_1002A45C8;
  if (os_log_type_enabled((os_log_t)qword_1002A45C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "VerifyRevisionInclusion: waiting for fetches to finish validating", buf, 2u);
  }
  v17 = objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation fetchGroup](self, "fetchGroup"));
  v18 = objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation fetchQueue](self, "fetchQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004AFE8;
  v19[3] = &unk_10023A390;
  v19[4] = self;
  dispatch_group_notify(v17, v18, v19);

}

- (BOOL)verifyInclusion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicKeyStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationPublicKeyStore:", v6));

  v10 = objc_msgSend(v9, "patLogBeginningMs");
  if (-[KTVerifyRevisionInclusionOperation verifySMHInclusion:logBeginMs:error:](self, "verifySMHInclusion:logBeginMs:error:", v6, v10, a4))
  {
    v11 = -[KTVerifyRevisionInclusionOperation verifySTHInclusion:logBeginMs:error:](self, "verifySTHInclusion:logBeginMs:error:", v6, v10, a4);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)verifySMHInclusion:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataStore"));
  v16 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "unverifiedRevisions:isMapHead:inclusion:logBeginMs:error:", v8, 1, 1, a4, &v16));
  v12 = v16;

  if (v11)
  {
    v13 = -[KTVerifyRevisionInclusionOperation downloadInclusionProofsForRevisions:application:downloadType:error:](self, "downloadInclusionProofsForRevisions:application:downloadType:error:", v11, v8, 1, a5);
  }
  else if (v12)
  {
    if (qword_1002A45C0 != -1)
      dispatch_once(&qword_1002A45C0, &stru_10023E580);
    v15 = qword_1002A45C8;
    if (os_log_type_enabled((os_log_t)qword_1002A45C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "failed to get inclusion unverified SMH revisions for %{public}@: %@", buf, 0x16u);
    }
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)verifySTHInclusion:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataStore"));
  v16 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "unverifiedRevisions:isMapHead:inclusion:logBeginMs:error:", v8, 0, 1, a4, &v16));
  v12 = v16;

  if (v11)
  {
    v13 = -[KTVerifyRevisionInclusionOperation downloadInclusionProofsForRevisions:application:downloadType:error:](self, "downloadInclusionProofsForRevisions:application:downloadType:error:", v11, v8, 2, a5);
  }
  else if (v12)
  {
    if (qword_1002A45C0 != -1)
      dispatch_once(&qword_1002A45C0, &stru_10023E5A0);
    v15 = qword_1002A45C8;
    if (os_log_type_enabled((os_log_t)qword_1002A45C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "failed to get inclusion unverified STH revisions for %{public}@: %@", buf, 0x16u);
    }
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)downloadInclusionProofsForRevisions:(id)a3 application:(id)a4 downloadType:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char v18;
  void *i;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;
  NSObject *v23;
  id v25;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  unint64_t v37;

  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logClient"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext chunkArray:chunkSize:](KTContext, "chunkArray:chunkSize:", v9, objc_msgSend(v12, "revisionLogMaxProofs")));

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v13;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v25 = v9;
      v16 = 0;
      v17 = *(_QWORD *)v30;
      v18 = 1;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          v20 = v16;
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v28 = v16;
          v22 = -[KTVerifyRevisionInclusionOperation downloadInclusionProofChunk:application:downloadType:error:](self, "downloadInclusionProofChunk:application:downloadType:error:", v21, v10, a5, &v28, v25);
          v16 = v28;

          if ((v22 & 1) == 0)
          {
            v18 = 0;
            if (a6)
            {
              if (v16)
              {
                v18 = 0;
                *a6 = objc_retainAutorelease(v16);
              }
            }
          }
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v15);

      v9 = v25;
    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    if (qword_1002A45C0 != -1)
      dispatch_once(&qword_1002A45C0, &stru_10023E5C0);
    v23 = qword_1002A45C8;
    v18 = 1;
    if (os_log_type_enabled((os_log_t)qword_1002A45C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v10;
      v36 = 2048;
      v37 = a5;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Skipping revision inclusion proof request -- no revisions for %@, type %lu", buf, 0x16u);
    }
  }

  return v18 & 1;
}

- (BOOL)downloadInclusionProofChunk:(id)a3 application:(id)a4 downloadType:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t *v27;
  id v28[2];
  id location;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t *v33;
  unint64_t v34;
  id *v35;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v10 = a3;
  v11 = a4;
  if (a5 == 1)
    v12 = 2;
  else
    v12 = 3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyRPCRequestBuilder buildRevisionLogInclusionProofRequest:logType:revisions:error:](TransparencyRPCRequestBuilder, "buildRevisionLogInclusionProofRequest:logType:revisions:error:", v11, v12, v10, a6));
  if (v13)
  {
    *(_QWORD *)buf = 0;
    v37 = buf;
    v38 = 0x3032000000;
    v39 = sub_10004BE84;
    v40 = sub_10004BE94;
    v41 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataStore"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10004BE9C;
    v30[3] = &unk_10023E648;
    v30[4] = self;
    v34 = a5;
    v16 = v11;
    v31 = v16;
    v17 = v10;
    v35 = a6;
    v32 = v17;
    v33 = buf;
    objc_msgSend(v15, "performBlockAndWaitWithMoc:", v30);

    v18 = objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation fetchGroup](self, "fetchGroup"));
    dispatch_group_enter(v18);

    location = 0;
    objc_initWeak(&location, self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTVerifyRevisionInclusionOperation deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "logClient"));
    v21 = *((_QWORD *)v37 + 5);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10004C198;
    v24[3] = &unk_10023E6F0;
    objc_copyWeak(v28, &location);
    v25 = v16;
    v27 = buf;
    v26 = v17;
    v28[1] = (id)a5;
    objc_msgSend(v20, "fetchRevisionLogInclusionProof:uuid:completionHandler:", v13, v21, v24);

    objc_destroyWeak(v28);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (qword_1002A45C0 != -1)
      dispatch_once(&qword_1002A45C0, &stru_10023E5E0);
    v22 = qword_1002A45C8;
    if (os_log_type_enabled((os_log_t)qword_1002A45C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "failed to create revision inclusion proof request", buf, 2u);
    }
  }

  return v13 != 0;
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
