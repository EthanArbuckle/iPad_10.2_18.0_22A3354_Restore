@implementation SFUIImageRequest

- (SFUIImageRequest)initWithRequestID:(int)a3 identifier:(id)a4 synchronous:(BOOL)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  SFUIImageRequest *v12;
  SFUIImageRequest *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  id resultHandler;
  objc_super v19;

  v10 = a4;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SFUIImageRequest;
  v12 = -[SFUIImageRequest init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_requestID = a3;
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_synchronous = a5;
    v16 = objc_msgSend(v11, "copy");
    resultHandler = v13->_resultHandler;
    v13->_resultHandler = (id)v16;

  }
  return v13;
}

- (int)requestID
{
  return self->_requestID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
