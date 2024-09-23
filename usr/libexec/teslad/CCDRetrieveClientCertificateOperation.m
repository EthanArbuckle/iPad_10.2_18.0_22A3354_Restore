@implementation CCDRetrieveClientCertificateOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  -[CCDOperation setOperationExecuting:](self, "setOperationExecuting:", 1);
  -[CCDOperation setOperationFinished:](self, "setOperationFinished:", 0);
  -[CCDRetrieveClientCertificateOperation retrieveClientCertificate](self, "retrieveClientCertificate");
}

- (void)retrieveClientCertificate
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100008898;
  v2[3] = &unk_100018A50;
  v2[4] = self;
  +[CCDDeviceIdentitySupport retrieveClientCertificateWithCompletion:](CCDDeviceIdentitySupport, "retrieveClientCertificateWithCompletion:", v2);
}

- (void)_completeOperationWithReferenceKey:(id)a3 certificates:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v18;
  int v19;
  CCDRetrieveClientCertificateOperation *v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CCDRetrieveClientCertificateOperation certificateRetrievalCompletionBlock](self, "certificateRetrievalCompletionBlock"));

  if (v11)
  {
    if (v10)
    {
      v15 = *(NSObject **)(DEPLogObjects(v12, v13, v14) + 8);
      v12 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        v19 = 138543618;
        v20 = self;
        v21 = 2112;
        v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Error: %@", (uint8_t *)&v19, 0x16u);
      }
    }
    v16 = *(NSObject **)(DEPLogObjects(v12, v13, v14) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ completed. Calling the completion block.", (uint8_t *)&v19, 0xCu);
    }
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CCDRetrieveClientCertificateOperation certificateRetrievalCompletionBlock](self, "certificateRetrievalCompletionBlock"));
    ((void (**)(_QWORD, id, id, id))v17)[2](v17, v8, v9, v10);

  }
  else
  {
    v18 = *(NSObject **)(DEPLogObjects(v12, v13, v14) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No completion block, canceling %{public}@", (uint8_t *)&v19, 0xCu);
    }
    -[CCDRetrieveClientCertificateOperation cancel](self, "cancel");
  }
  -[CCDOperation endOperation](self, "endOperation");

}

- (void)_retryCertificateRetrievalIfAllowed:(BOOL)a3 afterDelay:(double)a4 orFailWithError:(id)a5
{
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  if (a3)
  {
    v7 = *(NSObject **)(DEPLogObjects(self, a2, a3) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrying the request", buf, 2u);
    }
    -[CCDRetrieveClientCertificateOperation _startRetryTimerWithInterval:](self, "_startRetryTimerWithInterval:", a4);
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[CCDError maxRetriesExceededErrorWithUnderlyingError:](CCDError, "maxRetriesExceededErrorWithUnderlyingError:", a5, a4));
    -[CCDRetrieveClientCertificateOperation _completeOperationWithReferenceKey:certificates:error:](self, "_completeOperationWithReferenceKey:certificates:error:", 0, 0, v8);

  }
}

- (void)_retryCertificateRetrievalIfAllowedAfterDelayOrFailWithError:(id)a3
{
  id v4;

  v4 = a3;
  -[CCDRetrieveClientCertificateOperation setCertificateRetrievalRequestCount:](self, "setCertificateRetrievalRequestCount:", (char *)-[CCDRetrieveClientCertificateOperation certificateRetrievalRequestCount](self, "certificateRetrievalRequestCount")+ 1);
  -[CCDRetrieveClientCertificateOperation _retryCertificateRetrievalIfAllowed:afterDelay:orFailWithError:](self, "_retryCertificateRetrievalIfAllowed:afterDelay:orFailWithError:", -[CCDRetrieveClientCertificateOperation certificateRetrievalRequestCount](self, "certificateRetrievalRequestCount") < 5, v4, 4.0);

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
  -[CCDRetrieveClientCertificateOperation setTimeoutTimer:](self, "setTimeoutTimer:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDRetrieveClientCertificateOperation timeoutTimer](self, "timeoutTimer"));
  objc_msgSend(v9, "addTimer:forMode:", v8, NSRunLoopCommonModes);

}

- (void)timeoutTimerDidFire:(id)a3
{
  if (-[CCDRetrieveClientCertificateOperation certificateRetrievalFailed](self, "certificateRetrievalFailed", a3))
    -[CCDRetrieveClientCertificateOperation retrieveClientCertificate](self, "retrieveClientCertificate");
}

- (id)certificateRetrievalCompletionBlock
{
  return *(id *)(&self->_certificateRetrievalFailed + 3);
}

- (void)setCertificateRetrievalCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 19);
}

- (BOOL)certificateRetrievalFailed
{
  return *(&self->super._operationReady + 1);
}

- (void)setCertificateRetrievalFailed:(BOOL)a3
{
  *(&self->super._operationReady + 1) = a3;
}

- (int64_t)certificateRetrievalRequestCount
{
  return *(int64_t *)((char *)&self->_certificateRetrievalCompletionBlock + 3);
}

- (void)setCertificateRetrievalRequestCount:(int64_t)a3
{
  *(id *)((char *)&self->_certificateRetrievalCompletionBlock + 3) = (id)a3;
}

- (NSTimer)timeoutTimer
{
  return *(NSTimer **)((char *)&self->_certificateRetrievalRequestCount + 3);
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_certificateRetrievalRequestCount + 3), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_certificateRetrievalRequestCount + 3), 0);
  objc_storeStrong((id *)(&self->_certificateRetrievalFailed + 3), 0);
}

@end
