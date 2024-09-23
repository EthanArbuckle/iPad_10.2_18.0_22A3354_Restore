@implementation _ICDelegationServiceConnectionPendingRequestContext

- (_ICDelegationServiceConnectionPendingRequestContext)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v7;
  id v8;
  _ICDelegationServiceConnectionPendingRequestContext *v9;
  _ICDelegationServiceConnectionPendingRequestContext *v10;
  uint64_t v11;
  id responseHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_ICDelegationServiceConnectionPendingRequestContext;
  v9 = -[_ICDelegationServiceConnectionPendingRequestContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    v11 = MEMORY[0x1A1AFA8D0](v8);
    responseHandler = v10->_responseHandler;
    v10->_responseHandler = (id)v11;

  }
  return v10;
}

- (ICPBDGSRequest)request
{
  return self->_request;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
