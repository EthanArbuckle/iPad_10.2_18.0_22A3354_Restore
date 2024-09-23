@implementation KTValidatePendingRequestsOperation

- (KTValidatePendingRequestsOperation)initWithApplication:(id)a3 dependencies:(id)a4 opId:(id)a5
{
  id v9;
  id v10;
  id v11;
  KTValidatePendingRequestsOperation *v12;
  KTValidatePendingRequestsOperation *v13;
  void *v14;
  void *v15;
  void *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)KTValidatePendingRequestsOperation;
  v12 = -[KTGroupOperation init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deps, a4);
    objc_storeStrong((id *)&v13->_application, a3);
    -[KTValidatePendingRequestsOperation setBackgroundOpId:](v13, "setBackgroundOpId:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[KTValidatePendingRequestsOperation setErrors:](v13, "setErrors:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[KTValidatePendingRequestsOperation setRequestIds:](v13, "setRequestIds:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[KTValidatePendingRequestsOperation setServerHints:](v13, "setServerHints:", v16);

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create("VerifyInclusion_FetchWaiter", v18);
    -[KTValidatePendingRequestsOperation setFetchQueue:](v13, "setFetchQueue:", v19);

    -[KTGroupOperation setName:](v13, "setName:", CFSTR("KTRequest"));
  }

  return v13;
}

- (void)groupStart
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[8];

  if (qword_1002A4470 != -1)
    dispatch_once(&qword_1002A4470, &stru_10023AC68);
  v3 = qword_1002A4478;
  if (os_log_type_enabled((os_log_t)qword_1002A4478, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ValidatePendingRequests: start", buf, 2u);
  }
  v4 = objc_alloc_init((Class)NSOperation);
  -[KTValidatePendingRequestsOperation setFinishedOp:](self, "setFinishedOp:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v5);

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation application](self, "application"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logClient"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FEC4;
  v11[3] = &unk_10023AD38;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v7, "contextForApplication:logClient:fetchState:completionHandler:", v8, v10, 1, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)handleKTRequestDownload:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010880;
  v8[3] = &unk_10023ADA8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "fetchQueryForKTRequest:userInitiated:completionHandler:", v6, 0, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)handleKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  location = 0;
  objc_initWeak(&location, self);
  v24 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contextStore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation application](self, "application"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "logClient"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100010EDC;
  v25[3] = &unk_10023AE38;
  objc_copyWeak(&v30, &location);
  v20 = v14;
  v26 = v20;
  v21 = v13;
  v29 = v21;
  v22 = v11;
  v27 = v22;
  v23 = v12;
  v28 = v23;
  objc_msgSend(v16, "contextForApplication:logClient:fetchState:completionHandler:", v17, v19, 1, v25);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (id)failExpiredRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  CFAbsoluteTime v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isDeleted"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &unk_100213FA0);
  }
  else
  {
    objc_msgSend(v6, "requestTime");
    v10 = v9 + (double)kKTMaximumMergeDelayMs / 1000.0;
    if (v10 >= CFAbsoluteTimeGetCurrent())
    {
      v8 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failures"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation createChainOfErrorsFromRequestFailures:](self, "createChainOfErrorsFromRequestFailures:", v11));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithError:underlyingError:](TransparencyError, "errorWithError:underlyingError:", v7, v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -213, v13, CFSTR("failed to download query response for request")));

      if (qword_1002A4470 != -1)
        dispatch_once(&qword_1002A4470, &stru_10023AE58);
      v15 = (void *)qword_1002A4478;
      if (os_log_type_enabled((os_log_t)qword_1002A4478, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestId"));
        v26 = 138543874;
        v27 = v17;
        v28 = 2112;
        v29 = v14;
        v30 = 2112;
        v31 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "ValidatePendingRequests: Request validation failed after MMD for requestId %{public}@, error: %@, underlyingError: %@", (uint8_t *)&v26, 0x20u);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dataStore"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "createRequestFailure"));

      objc_msgSend(v20, "setErrorCode:", -213);
      objc_msgSend(v20, "setErrorDomain:", CFSTR("TransparencyErrorVerify"));
      objc_msgSend(v20, "setRequest:", v6);
      objc_msgSend(v6, "setVerificationResult:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
      v22 = objc_msgSend(v6, "type");
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation application](self, "application"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[KTContext validateEventName:application:](KTContext, "validateEventName:application:", v22, v23));
      objc_msgSend(v21, "logResultForEvent:hardFailure:result:", v24, 1, v14);

      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestId"));
    }
  }

  return v8;
}

- (void)saveRequestFailure:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataStore"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createRequestFailure"));

  objc_msgSend(v11, "setErrorCode:", objc_msgSend(v6, "code"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));

  objc_msgSend(v11, "setErrorDomain:", v10);
  objc_msgSend(v11, "setRequest:", v7);

}

- (id)createChainOfErrorsFromRequestFailures:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidatePendingRequestsOperation createErrorFromRequestFailure:underlyingError:](self, "createErrorFromRequestFailure:underlyingError:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), v10));

        v9 = (char *)v9 + 1;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)createErrorFromRequestFailure:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "errorDomain"));
  v8 = objc_msgSend(v6, "errorCode");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v7, v8, v5, 0));
  return v9;
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

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (OS_dispatch_group)fetchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFetchGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (OS_dispatch_queue)fetchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFetchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSMutableArray)errors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSMutableArray)requestIds
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRequestIds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSMutableArray)serverHints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setServerHints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHints, 0);
  objc_storeStrong((id *)&self->_requestIds, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_backgroundOpId, 0);
  objc_storeStrong((id *)&self->_deps, 0);
}

@end
