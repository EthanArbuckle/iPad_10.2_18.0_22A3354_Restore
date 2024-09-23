@implementation ICSAPSessionSignDataOperation

- (void)executeWithSAPContext:(id)a3
{
  NSData *data;
  char v6;
  id v7;
  id v8;
  void *v9;
  void (**responseHandler)(id, _QWORD, void *);
  id v11;
  id v12;
  id v13;

  data = self->_data;
  v12 = 0;
  v13 = 0;
  v6 = objc_msgSend(a3, "signData:returningSignatureData:error:", data, &v13, &v12);
  v7 = v13;
  v8 = v12;
  v9 = v8;
  if ((v6 & 1) == 0 && !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  responseHandler = (void (**)(id, _QWORD, void *))self->_responseHandler;
  if (responseHandler)
  {
    if (v9)
      v11 = 0;
    else
      v11 = v7;
    ((void (**)(id, id, void *))responseHandler)[2](responseHandler, v11, v9);
  }
  -[ICSAPSessionAbstractOperation finishWithError:](self, "finishWithError:", v9);

}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)finishWithSAPContextPreparationError:(id)a3
{
  id v4;
  void (**responseHandler)(id, _QWORD, id);
  id v6;

  v4 = a3;
  responseHandler = (void (**)(id, _QWORD, id))self->_responseHandler;
  v6 = v4;
  if (responseHandler)
  {
    responseHandler[2](responseHandler, 0, v4);
    v4 = v6;
  }
  -[ICSAPSessionAbstractOperation finishWithError:](self, "finishWithError:", v4);

}

- (NSData)data
{
  return self->_data;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

@end
