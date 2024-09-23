@implementation CSStudiesServerSubmitter

- (void)createSession
{
  void *v3;
  void *v4;
  void *v5;
  NSURLSession *v6;
  NSURLSession *session;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.anomalydetectiond.CSStudiesServerSubmitter:%@"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:](NSURLSessionConfiguration, "backgroundSessionConfigurationWithIdentifier:", v4));

  objc_msgSend(v5, "setDiscretionary:", 1);
  objc_msgSend(v5, "setAllowsCellularAccess:", 0);
  objc_msgSend(v5, "setWaitsForConnectivity:", 1);
  objc_msgSend(v5, "setTimeoutIntervalForResource:", 604800.0);
  v6 = (NSURLSession *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v5, self, 0));
  session = self->_session;
  self->_session = v6;

}

- (CSStudiesServerSubmitter)initWithEndpoint:(id)a3 authorization:(id)a4 subjectToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  CSStudiesServerSubmitter *v12;
  CSStudiesServerSubmitter *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *completionHandlers;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CSStudiesServerSubmitter;
  v12 = -[CSStudiesServerSubmitter init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpoint, a3);
    objc_storeStrong((id *)&v13->_authorization, a4);
    objc_storeStrong((id *)&v13->_subjectToken, a5);
    -[CSStudiesServerSubmitter createSession](v13, "createSession");
    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    completionHandlers = v13->_completionHandlers;
    v13->_completionHandlers = v14;

  }
  return v13;
}

- (void)updateRegistrationWithSubjectToken:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (qword_100387400 != -1)
    dispatch_once(&qword_100387400, &stru_100346E18);
  v5 = qword_100387408;
  if (os_log_type_enabled((os_log_t)qword_100387408, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Updating submitter registration", v6, 2u);
  }
  -[CSStudiesServerSubmitter setSubjectToken:](self, "setSubjectToken:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerSubmitter session](self, "session"));
  objc_msgSend(v3, "finishTasksAndInvalidate");

  v4.receiver = self;
  v4.super_class = (Class)CSStudiesServerSubmitter;
  -[CSStudiesServerSubmitter dealloc](&v4, "dealloc");
}

- (void)submitFileWithURL:(id)a3 andCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  dispatch_semaphore_t v9;
  NSURLSession *session;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *completionHandlers;
  void (**v23)(id, _QWORD, void *);
  void *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  uint8_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  char v32;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (qword_100387400 != -1)
    dispatch_once(&qword_100387400, &stru_100346E18);
  v8 = qword_100387408;
  if (os_log_type_enabled((os_log_t)qword_100387408, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "submitFileWithURL", buf, 2u);
  }
  v9 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v30 = buf;
  v31 = 0x2020000000;
  v32 = 0;
  session = self->_session;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000162F8;
  v25[3] = &unk_100346DF8;
  v11 = v6;
  v26 = v11;
  v28 = buf;
  v12 = v9;
  v27 = v12;
  -[NSURLSession getTasksWithCompletionHandler:](session, "getTasksWithCompletionHandler:", v25);
  v13 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 4610, 0));
    v7[2](v7, 0, v14);
  }
  else if (v30[24])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 516, 0));
    v7[2](v7, 0, v14);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerSubmitter endpoint](self, "endpoint"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v15));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerSubmitter authorization](self, "authorization"));
    objc_msgSend(v14, "setValue:forHTTPHeaderField:", v16, CFSTR("Authorization"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerSubmitter subjectToken](self, "subjectToken"));
    objc_msgSend(v14, "setValue:forHTTPHeaderField:", v17, CFSTR("X-HDS-Subject-Authorization"));

    objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
    objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
    objc_msgSend(v14, "setAllowsCellularAccess:", 0);
    objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerSubmitter session](self, "session"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uploadTaskWithRequest:fromFile:", v14, v11));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
    objc_msgSend(v19, "setTaskDescription:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v19, "setEarliestBeginDate:", v21);

    completionHandlers = self->_completionHandlers;
    v23 = objc_retainBlock(v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "taskDescription"));
    -[NSMutableDictionary setObject:forKey:](completionHandlers, "setObject:forKey:", v23, v24);

    objc_msgSend(v19, "resume");
  }

  _Block_object_dispose(buf, 8);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskDescription"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_completionHandlers, "objectForKey:", v11));

    if (v12)
    {
      v13 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_completionHandlers, "objectForKey:", v11));
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
      if (v10)
      {
        (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v10);
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "response"));
        ((void (**)(_QWORD, void *, _QWORD))v14)[2](v14, v23, 0);

        -[NSMutableDictionary removeObjectForKey:](self->_completionHandlers, "removeObjectForKey:", v11);
      }

      goto LABEL_16;
    }
    if (qword_100387400 != -1)
      dispatch_once(&qword_100387400, &stru_100346E18);
    v22 = (void *)qword_100387408;
    if (os_log_type_enabled((os_log_t)qword_100387408, OS_LOG_TYPE_ERROR))
    {
      v16 = v22;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
      v24 = 138543618;
      v25 = v18;
      v26 = 2114;
      v27 = v11;
      v19 = "Got called for %{public}@ with non existent file: %{public}@";
      v20 = v16;
      v21 = 22;
      goto LABEL_13;
    }
  }
  else
  {
    if (qword_100387400 != -1)
      dispatch_once(&qword_100387400, &stru_100346E18);
    v15 = (void *)qword_100387408;
    if (os_log_type_enabled((os_log_t)qword_100387408, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
      v24 = 138543362;
      v25 = v18;
      v19 = "Got called with task with no file for: %{public}@";
      v20 = v16;
      v21 = 12;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v24, v21);

    }
  }
LABEL_16:

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  void *v26;

  v11 = a3;
  v12 = a4;
  if (qword_100387400 != -1)
    dispatch_once(&qword_100387400, &stru_100346E18);
  v13 = (void *)qword_100387408;
  if (os_log_type_enabled((os_log_t)qword_100387408, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    v17 = 138413314;
    v18 = v12;
    v19 = 2048;
    v20 = a5;
    v21 = 2048;
    v22 = a6;
    v23 = 2048;
    v24 = a7;
    v25 = 2112;
    v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Got called back with task: %@ and bytesSent: %lld and totalBytesSent: %lld and totalBytesExpectedToSend: %lld and id: %@", (uint8_t *)&v17, 0x34u);

  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (qword_100387400 != -1)
    dispatch_once(&qword_100387400, &stru_100346E18);
  v8 = qword_100387408;
  if (os_log_type_enabled((os_log_t)qword_100387408, OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Session got invalidated with error: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  -[CSStudiesServerSubmitter createSession](self, "createSession");

}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)endpoint
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)authorization
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)subjectToken
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSubjectToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)completionHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_subjectToken, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
