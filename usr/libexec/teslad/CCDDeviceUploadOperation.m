@implementation CCDDeviceUploadOperation

- (void)completeOperationWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  NSObject *v14;
  int v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadOperation deviceUploadCompletionBlock](self, "deviceUploadCompletionBlock"));

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
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadOperation deviceUploadCompletionBlock](self, "deviceUploadCompletionBlock"));
    ((void (**)(_QWORD, id, id))v13)[2](v13, v6, v7);

  }
  else
  {
    v14 = *(NSObject **)(DEPLogObjects(v9, v10, v11) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No completion block, canceling operation", (uint8_t *)&v15, 2u);
    }
    -[CCDDeviceUploadOperation cancel](self, "cancel");
  }

}

- (id)deviceUploadCompletionBlock
{
  return *(id *)(&self->_operationFinished + 2);
}

- (void)setDeviceUploadCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 91);
}

- (NSError)error
{
  return *(NSError **)((char *)&self->_deviceUploadCompletionBlock + 3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_deviceUploadCompletionBlock + 3), a3);
}

- (BOOL)operationExecuting
{
  return BYTE3(self->super._httpResponseContentType);
}

- (void)setOperationExecuting:(BOOL)a3
{
  BYTE3(self->super._httpResponseContentType) = a3;
}

- (BOOL)operationFinished
{
  return BYTE4(self->super._httpResponseContentType);
}

- (void)setOperationFinished:(BOOL)a3
{
  BYTE4(self->super._httpResponseContentType) = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_responseData + 3), 0);
  objc_storeStrong((id *)((char *)&self->_error + 3), 0);
  objc_storeStrong((id *)((char *)&self->_deviceUploadCompletionBlock + 3), 0);
  objc_storeStrong((id *)(&self->_operationFinished + 2), 0);
}

@end
