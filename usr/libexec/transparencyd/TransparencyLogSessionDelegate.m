@implementation TransparencyLogSessionDelegate

- (TransparencyLogSessionDelegate)initWithDataStore:(id)a3 workloop:(id)a4
{
  id v6;
  id v7;
  TransparencyLogSessionDelegate *v8;
  TransparencyLogSessionDelegate *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TransparencyLogSessionDelegate;
  v8 = -[TransparencyLogSessionDelegate init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[TransparencyLogSessionDelegate setDataStore:](v8, "setDataStore:", v6);
    -[TransparencyLogSessionDelegate setWorkloop:](v9, "setWorkloop:", v7);
  }

  return v9;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int64_t v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  if (qword_1002A7C08 != -1)
    dispatch_once(&qword_1002A7C08, &stru_10024CAB8);
  v12 = (void *)qword_1002A7C10;
  if (os_log_type_enabled((os_log_t)qword_1002A7C10, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentRequest"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteURL"));
    v17 = 134218498;
    v18 = a6;
    v19 = 2048;
    v20 = a7;
    v21 = 2112;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Wrote %lld bytes of %lld total bytes for request %@", (uint8_t *)&v17, 0x20u);

  }
}

- (void)handleDownloadRecord:(id)a3 downloadData:(id)a4 downloadMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  TransparencyLogSessionDelegate *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSessionDelegate dataStore](self, "dataStore"));
  v24 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001A3354;
  v19[3] = &unk_10024CB20;
  v12 = v9;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  v22 = self;
  v14 = v8;
  v23 = v14;
  LODWORD(v10) = objc_msgSend(v11, "performAndWaitForDownloadId:error:block:", v14, &v24, v19);
  v15 = v24;

  if (!(_DWORD)v10 || v15)
  {
    if (qword_1002A7C08 != -1)
      dispatch_once(&qword_1002A7C08, &stru_10024CB40);
    v16 = qword_1002A7C10;
    if (os_log_type_enabled((os_log_t)qword_1002A7C10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to fetch download record %@: %@", buf, 0x16u);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("NetworkDownloadEvent"), kKTApplicationIdentifierTLT));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    objc_msgSend(v18, "logResultForEvent:hardFailure:result:", v17, 1, v15);

  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  TransparencyLogSessionDelegate *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1002A7C08 != -1)
    dispatch_once(&qword_1002A7C08, &stru_10024CB60);
  v11 = qword_1002A7C10;
  if (os_log_type_enabled((os_log_t)qword_1002A7C10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Download task %@ completed successfully", buf, 0xCu);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "response"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_requestId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v10));
  v16 = objc_claimAutoreleasedReturnValue(-[TransparencyLogSessionDelegate workloop](self, "workloop"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001A3B0C;
  v25[3] = &unk_10024CB88;
  v17 = v13;
  v26 = v17;
  v27 = self;
  v18 = v14;
  v28 = v18;
  v19 = v15;
  v29 = v19;
  v20 = v9;
  v30 = v20;
  +[TransparencyLogSession dispatchToQueue:block:](TransparencyLogSession, "dispatchToQueue:block:", v16, v25);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v24 = 0;
  LOBYTE(v16) = objc_msgSend(v21, "removeItemAtURL:error:", v10, &v24);
  v22 = v24;

  if ((v16 & 1) == 0)
  {
    if (qword_1002A7C08 != -1)
      dispatch_once(&qword_1002A7C08, &stru_10024CBA8);
    v23 = qword_1002A7C10;
    if (os_log_type_enabled((os_log_t)qword_1002A7C10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v10;
      v33 = 2112;
      v34 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
    }
  }

}

- (void)handleDownloadRecordFailure:(id)a3 task:(id)a4 downloadMetadata:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  id v22;
  unsigned __int8 v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  unsigned __int8 v29;
  uint64_t v30;
  void **v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  TransparencyLogSessionDelegate *v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSessionDelegate dataStore](self, "dataStore"));
  v40 = 0;
  v31 = _NSConcreteStackBlock;
  v32 = 3221225472;
  v33 = sub_1001A3EA8;
  v34 = &unk_10024CC50;
  v15 = v13;
  v35 = v15;
  v16 = v11;
  v36 = v16;
  v17 = v10;
  v37 = v17;
  v18 = v12;
  v38 = v18;
  v39 = self;
  v19 = objc_msgSend(v14, "performAndWaitForDownloadId:error:block:", v17, &v40, &v31);
  v20 = v40;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain", v31, v32, v33, v34));
  if (objc_msgSend(v21, "isEqualToString:", NSURLErrorDomain))
  {
    v22 = objc_msgSend(v15, "code");

    if (v20)
      v23 = 0;
    else
      v23 = v19;
    if ((v23 & 1) != 0)
      goto LABEL_20;
    if (v22 == (id)-999)
    {
      if (qword_1002A7C08 != -1)
        dispatch_once(&qword_1002A7C08, &stru_10024CC90);
      v24 = qword_1002A7C10;
      if (os_log_type_enabled((os_log_t)qword_1002A7C10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v17;
        v25 = "Failed to fetch cancelled downloadId %{public}@";
        v26 = v24;
        v27 = OS_LOG_TYPE_DEFAULT;
        v28 = 12;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buf, v28);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  else
  {

    if (v20)
      v29 = 0;
    else
      v29 = v19;
    if ((v29 & 1) != 0)
      goto LABEL_20;
  }
  if (qword_1002A7C08 != -1)
    dispatch_once(&qword_1002A7C08, &stru_10024CC70);
  v30 = qword_1002A7C10;
  if (os_log_type_enabled((os_log_t)qword_1002A7C10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v42 = v17;
    v43 = 2112;
    v44 = v20;
    v25 = "Failed to fetch downloadId %{public}@ for failed download: %@";
    v26 = v30;
    v27 = OS_LOG_TYPE_ERROR;
    v28 = 22;
    goto LABEL_19;
  }
LABEL_20:

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v14 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "originalRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "response"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_requestId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "response"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyLogSession createErrorFromURLResonse:data:allowEmptyData:error:](TransparencyLogSession, "createErrorFromURLResonse:data:allowEmptyData:error:", v11, 0, 1, v7));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSessionDelegate workloop](self, "workloop"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001A454C;
    v15[3] = &unk_10024CB88;
    v15[4] = self;
    v16 = v10;
    v17 = v14;
    v18 = v9;
    v19 = v12;
    +[TransparencyLogSession dispatchToQueue:block:](TransparencyLogSession, "dispatchToQueue:block:", v13, v15);

  }
}

- (KTContextStore)contextStore
{
  return (KTContextStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContextStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (KTLogClient)logClient
{
  return (KTLogClient *)objc_loadWeakRetained((id *)&self->_logClient);
}

- (void)setLogClient:(id)a3
{
  objc_storeWeak((id *)&self->_logClient, a3);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_workloop)workloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkloop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_destroyWeak((id *)&self->_logClient);
  objc_storeStrong((id *)&self->_contextStore, 0);
}

@end
