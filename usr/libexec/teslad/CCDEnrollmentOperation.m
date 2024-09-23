@implementation CCDEnrollmentOperation

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a3;
  v13 = a4;
  if (a5 > 499)
  {
    if (a5 == 500)
    {
      if (a7)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError teslaServiceDownError](CCDError, "teslaServiceDownError"));
LABEL_12:
        v14 = 0;
        *a7 = v15;
        goto LABEL_14;
      }
LABEL_13:
      v14 = 0;
      goto LABEL_14;
    }
    if (a5 == 503)
    {
      v14 = 0;
      *a6 = 1;
      goto LABEL_14;
    }
LABEL_10:
    if (a7)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentOperation errorForStatusCode:responseData:](self, "errorForStatusCode:responseData:", a5, v12));
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (a5 != 200 && a5 != 204)
    goto LABEL_10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentOperation responseWithResponseData:contentType:outError:](self, "responseWithResponseData:contentType:outError:", v12, v13, a7));
LABEL_14:

  return v14;
}

- (void)completeOperationWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v14;
  int v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentOperation enrollmentCompletionBlock](self, "enrollmentCompletionBlock"));

  if (v8)
  {
    if (v7)
    {
      v12 = *(NSObject **)(DEPLogObjects(v9, v10, v11) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CCDEnrollmentOperation enrollmentCompletionBlock](self, "enrollmentCompletionBlock"));
    ((void (**)(_QWORD, BOOL, id, id))v13)[2](v13, v7 == 0, v6, v7);

  }
  else
  {
    v14 = *(NSObject **)(DEPLogObjects(v9, v10, v11) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No completion block, canceling operation", (uint8_t *)&v15, 2u);
    }
    -[CCDEnrollmentOperation cancel](self, "cancel");
  }

}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  return 0;
}

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  return 0;
}

- (id)enrollmentCompletionBlock
{
  return *(id *)(&self->_certificateRetrievalFailed + 3);
}

- (void)setEnrollmentCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 91);
}

- (int64_t)certificateRetrievalRequestCount
{
  return *(int64_t *)((char *)&self->_enrollmentCompletionBlock + 3);
}

- (void)setCertificateRetrievalRequestCount:(int64_t)a3
{
  *(id *)((char *)&self->_enrollmentCompletionBlock + 3) = (id)a3;
}

- (NSTimer)timeoutTimer
{
  return *(NSTimer **)((char *)&self->_certificateRetrievalRequestCount + 3);
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_certificateRetrievalRequestCount + 3), a3);
}

- (BOOL)certificateRetrievalFailed
{
  return BYTE3(self->super._httpResponseContentType);
}

- (void)setCertificateRetrievalFailed:(BOOL)a3
{
  BYTE3(self->super._httpResponseContentType) = a3;
}

- (double)retryAfterInterval
{
  return *(double *)((char *)&self->_timeoutTimer + 3);
}

- (void)setRetryAfterInterval:(double)a3
{
  *(double *)((char *)&self->_timeoutTimer + 3) = a3;
}

- (NSError)error
{
  return *(NSError **)((char *)&self->_retryAfterInterval + 3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_retryAfterInterval + 3), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_retryAfterInterval + 3), 0);
  objc_storeStrong((id *)((char *)&self->_certificateRetrievalRequestCount + 3), 0);
  objc_storeStrong((id *)(&self->_certificateRetrievalFailed + 3), 0);
}

@end
