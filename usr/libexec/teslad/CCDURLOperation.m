@implementation CCDURLOperation

- (void)dealloc
{
  objc_super v3;

  -[CCDURLOperation _invalidateAndCancelURLSession](self, "_invalidateAndCancelURLSession");
  v3.receiver = self;
  v3.super_class = (Class)CCDURLOperation;
  -[CCDURLOperation dealloc](&v3, "dealloc");
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new(NSMutableData, a2);
  -[CCDURLOperation setResponseData:](self, "setResponseData:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation urlSession](self, "urlSession"));
  objc_msgSend(v4, "invalidateAndCancel");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v5, self, v6));
  -[CCDURLOperation setUrlSession:](self, "setUrlSession:", v7);

  -[CCDOperation setOperationExecuting:](self, "setOperationExecuting:", 1);
  -[CCDOperation setOperationFinished:](self, "setOperationFinished:", 0);
  -[CCDURLOperation setRequestCount:](self, "setRequestCount:", 0);
  -[CCDURLOperation setRequestFailed:](self, "setRequestFailed:", 0);
  -[CCDURLOperation _startURLRequest](self, "_startURLRequest");
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7
{
  return 0;
}

- (void)_invalidateAndCancelURLSession
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation urlSession](self, "urlSession"));
  objc_msgSend(v3, "invalidateAndCancel");

  -[CCDURLOperation setUrlSession:](self, "setUrlSession:", 0);
}

- (void)_startURLRequest
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t v16[8];
  id v17;
  uint8_t buf[16];

  v3 = *(NSObject **)(DEPLogObjects(self, a2) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting URL Request", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation teslaRequest](self, "teslaRequest"));
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestWithError:", &v17));
  v6 = v17;

  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation urlSession](self, "urlSession"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataTaskWithRequest:", v5));

    if (v10)
    {
      v13 = *(NSObject **)(DEPLogObjects(v11, v12) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Resume data task", v15, 2u);
      }
      objc_msgSend(v10, "resume");
    }
    else
    {
      -[CCDURLOperation setError:](self, "setError:", v6);
      -[CCDURLOperation _sendFailureNoticeToRemote](self, "_sendFailureNoticeToRemote");
    }

  }
  else
  {
    v14 = *(NSObject **)(DEPLogObjects(v7, v8) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to build URL request", v16, 2u);
    }
    -[CCDURLOperation setError:](self, "setError:", v6);
    -[CCDURLOperation _sendFailureNoticeToRemote](self, "_sendFailureNoticeToRemote");
  }

}

- (void)_sendFailureNoticeToRemote
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = *(NSObject **)(DEPLogObjects(self, a2) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending failure response back to client", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation error](self, "error"));
  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 34000));
  -[CCDURLOperation _callCompletionBlockWithResponse:error:](self, "_callCompletionBlockWithResponse:error:", 0, v4);

}

- (void)endOperation
{
  objc_super v3;

  -[CCDURLOperation _invalidateAndCancelURLSession](self, "_invalidateAndCancelURLSession");
  v3.receiver = self;
  v3.super_class = (Class)CCDURLOperation;
  -[CCDOperation endOperation](&v3, "endOperation");
}

- (void)_callCompletionBlockWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  CCDURLOperation *v11;

  v6 = a4;
  v7 = a3;
  v9 = *(NSObject **)(DEPLogObjects(v7, v8) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ completed. Calling the completion block.", (uint8_t *)&v10, 0xCu);
  }
  -[CCDURLOperation completeOperationWithResponse:error:](self, "completeOperationWithResponse:error:", v7, v6);

  -[CCDURLOperation endOperation](self, "endOperation");
}

- (int64_t)_statusCodeFromResponse:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;

  v4 = a3;
  v5 = objc_opt_class(NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "statusCode");
    if (v7 == (id)503)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allHeaderFields"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Retry-After")));

      v10 = (uint64_t)objc_msgSend(v9, "integerValue");
      if (v10 >= 1)
        -[CCDURLOperation setRetryAfterInterval:](self, "setRetryAfterInterval:", (double)v10);
      -[CCDURLOperation retryAfterInterval](self, "retryAfterInterval");
      if (v11 < 2.0)
        -[CCDURLOperation setRetryAfterInterval:](self, "setRetryAfterInterval:", 2.0);

    }
  }
  else
  {
    v7 = 0;
  }

  return (int64_t)v7;
}

- (void)_sendResponseInfoToRemoteWithStatusCode:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  uint8_t buf[16];

  v5 = *(NSObject **)(DEPLogObjects(self, a2) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Send response info to remote", buf, 2u);
  }
  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation responseData](self, "responseData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation httpResponseContentType](self, "httpResponseContentType"));
  v11 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation responseWithResponseData:contentType:statusCode:retryNeeded:outError:](self, "responseWithResponseData:contentType:statusCode:retryNeeded:outError:", v6, v7, a3, &v12, &v11));
  v9 = v11;

  if (v9)
  {
    -[CCDURLOperation setError:](self, "setError:", v9);
    -[CCDURLOperation _sendFailureNoticeToRemote](self, "_sendFailureNoticeToRemote");
  }
  else if (v12)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError serviceBusyError](CCDError, "serviceBusyError"));
    -[CCDURLOperation _retryRequestOrFailWithError:](self, "_retryRequestOrFailWithError:", v10);

  }
  else
  {
    -[CCDURLOperation _callCompletionBlockWithResponse:error:](self, "_callCompletionBlockWithResponse:error:", v8, 0);
  }

}

- (void)_printStatusCode:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Response code: %ld, "), a3));
  v5 = v4;
  if (a3 > 400)
  {
    if (a3 == 401)
    {
      v6 = CFSTR("Auth Failure");
      goto LABEL_11;
    }
    if (a3 == 500)
    {
      v6 = CFSTR("Server Exception");
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == 200)
    {
      v6 = CFSTR("Success");
      goto LABEL_11;
    }
    if (a3 == 400)
    {
      v6 = CFSTR("Invalid Request");
      goto LABEL_11;
    }
  }
  v6 = CFSTR("Unknown Response");
LABEL_11:
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", v6));

  v10 = *(NSObject **)(DEPLogObjects(v8, v9) + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t);
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;

  v8 = a5;
  v9 = (void (**)(id, uint64_t))a6;
  v10 = v8;
  v11 = objc_opt_class(NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allHeaderFields"));
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Content-Type")));
      -[CCDURLOperation setHttpResponseContentType:](self, "setHttpResponseContentType:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allHeaderFields"));
      v17 = *(NSObject **)(DEPLogObjects(v15, v16) + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
        v20 = 138543362;
        v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Response Headers: %{public}@", (uint8_t *)&v20, 0xCu);

      }
    }

  }
  v9[2](v9, 1);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v6 = a5;
  v8 = *(NSObject **)(DEPLogObjects(v6, v7) + 8);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received actual data", buf, 2u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation responseData](self, "responseData"));
    objc_msgSend(v10, "appendData:", v6);

  }
  else if (v9)
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No data received.", v11, 2u);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int64_t v12;
  int v13;
  void *v14;

  v7 = a5;
  v9 = v7;
  if (v7)
  {
    v10 = *(NSObject **)(DEPLogObjects(v7, v8) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v13, 0xCu);
    }
    -[CCDURLOperation _sendFailureNoticeToRemote](self, "_sendFailureNoticeToRemote");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "response"));
    v12 = -[CCDURLOperation _statusCodeFromResponse:](self, "_statusCodeFromResponse:", v11);

    -[CCDURLOperation _printStatusCode:](self, "_printStatusCode:", v12);
    -[CCDURLOperation _sendResponseInfoToRemoteWithStatusCode:](self, "_sendResponseInfoToRemoteWithStatusCode:", v12);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void (**v6)(id, uint64_t, _QWORD);
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = (void (**)(id, uint64_t, _QWORD))a6;
  v9 = *(NSObject **)(DEPLogObjects(v6, v7, v8) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Default challange handling", v10, 2u);
  }
  v6[2](v6, 1, 0);

}

- (void)_retryRequestOrFailWithError:(id)a3
{
  id v4;

  v4 = a3;
  -[CCDURLOperation retryAfterInterval](self, "retryAfterInterval");
  -[CCDURLOperation _retryRequestIfAllowed:afterDelay:orFailWithError:](self, "_retryRequestIfAllowed:afterDelay:orFailWithError:", 1, v4);

}

- (void)_retryRequestIfAllowed:(BOOL)a3 afterDelay:(double)a4 orFailWithError:(id)a5
{
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  if (a3)
  {
    v7 = *(NSObject **)(DEPLogObjects(self, a2) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrying the request", buf, 2u);
    }
    -[CCDURLOperation _startRetryTimerWithInterval:](self, "_startRetryTimerWithInterval:", a4);
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[CCDError maxRetriesExceededErrorWithUnderlyingError:](CCDError, "maxRetriesExceededErrorWithUnderlyingError:", a5, a4));
    -[CCDURLOperation _callCompletionBlockWithResponse:error:](self, "_callCompletionBlockWithResponse:error:", 0, v8);

  }
}

- (void)_retryRequestIfAllowedAfterDelayOrFailWithError:(id)a3
{
  id v4;

  v4 = a3;
  -[CCDURLOperation setRequestCount:](self, "setRequestCount:", (char *)-[CCDURLOperation requestCount](self, "requestCount") + 1);
  -[CCDURLOperation _retryRequestIfAllowed:afterDelay:orFailWithError:](self, "_retryRequestIfAllowed:afterDelay:orFailWithError:", -[CCDURLOperation requestCount](self, "requestCount") < 3, v4, 2.0);

}

- (void)_startRetryTimerWithInterval:(double)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = objc_alloc((Class)NSTimer);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
  v7 = objc_msgSend(v5, "initWithFireDate:interval:target:selector:userInfo:repeats:", v6, self, "timeoutTimerDidFire:", 0, 0, 0.0);
  -[CCDURLOperation setTimeoutTimer:](self, "setTimeoutTimer:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation timeoutTimer](self, "timeoutTimer"));
  objc_msgSend(v9, "addTimer:forMode:", v8, NSRunLoopCommonModes);

}

- (void)timeoutTimerDidFire:(id)a3
{
  if (-[CCDURLOperation requestFailed](self, "requestFailed", a3))
    -[CCDURLOperation _startURLRequest](self, "_startURLRequest");
}

- (CCDRequest)teslaRequest
{
  return *(CCDRequest **)(&self->_requestFailed + 3);
}

- (void)setTeslaRequest:(id)a3
{
  objc_storeStrong((id *)(&self->_requestFailed + 3), a3);
}

- (NSError)error
{
  return *(NSError **)((char *)&self->_teslaRequest + 3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_teslaRequest + 3), a3);
}

- (NSMutableData)responseData
{
  return *(NSMutableData **)((char *)&self->_error + 3);
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_error + 3), a3);
}

- (NSURLSession)urlSession
{
  return *(NSURLSession **)((char *)&self->_responseData + 3);
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_responseData + 3), a3);
}

- (NSTimer)timeoutTimer
{
  return *(NSTimer **)((char *)&self->_urlSession + 3);
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_urlSession + 3), a3);
}

- (double)retryAfterInterval
{
  return *(double *)((char *)&self->_timeoutTimer + 3);
}

- (void)setRetryAfterInterval:(double)a3
{
  *(double *)((char *)&self->_timeoutTimer + 3) = a3;
}

- (BOOL)requestFailed
{
  return *(&self->super._operationReady + 1);
}

- (void)setRequestFailed:(BOOL)a3
{
  *(&self->super._operationReady + 1) = a3;
}

- (int64_t)requestCount
{
  return *(_QWORD *)((char *)&self->_retryAfterInterval + 3);
}

- (void)setRequestCount:(int64_t)a3
{
  *(_QWORD *)((char *)&self->_retryAfterInterval + 3) = a3;
}

- (NSString)httpResponseContentType
{
  return *(NSString **)((char *)&self->_requestCount + 3);
}

- (void)setHttpResponseContentType:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_requestCount + 3), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_requestCount + 3), 0);
  objc_storeStrong((id *)((char *)&self->_urlSession + 3), 0);
  objc_storeStrong((id *)((char *)&self->_responseData + 3), 0);
  objc_storeStrong((id *)((char *)&self->_error + 3), 0);
  objc_storeStrong((id *)((char *)&self->_teslaRequest + 3), 0);
  objc_storeStrong((id *)(&self->_requestFailed + 3), 0);
}

@end
