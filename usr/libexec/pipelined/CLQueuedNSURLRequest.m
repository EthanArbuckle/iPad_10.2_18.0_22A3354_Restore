@implementation CLQueuedNSURLRequest

- (CLQueuedNSURLRequest)initWithRequest:(id)a3 withPriority:(int64_t)a4 andResumeData:(id)a5 andCountOfBytesClientExpectsToReceive:(int64_t)a6
{
  id v11;
  id v12;
  CLQueuedNSURLRequest *v13;
  CLQueuedNSURLRequest *v14;
  CLQueuedNSURLRequest *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CLQueuedNSURLRequest;
  v13 = -[CLQueuedNSURLRequest init](&v17, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_request, a3);
    v14->_priority = a4;
    objc_storeStrong((id *)&v14->_resumeData, a5);
    v14->_countOfBytesClientExpectsToReceive = a6;
    v15 = v14;
  }

  return v14;
}

- (CLQueuedNSURLRequest)initWithRequest:(id)a3 withPriority:(int64_t)a4
{
  return -[CLQueuedNSURLRequest initWithRequest:withPriority:andResumeData:andCountOfBytesClientExpectsToReceive:](self, "initWithRequest:withPriority:andResumeData:andCountOfBytesClientExpectsToReceive:", a3, a4, 0, NSURLSessionTransferSizeUnknown);
}

- (CLQueuedNSURLRequest)initWithRequest:(id)a3
{
  return -[CLQueuedNSURLRequest initWithRequest:withPriority:andResumeData:andCountOfBytesClientExpectsToReceive:](self, "initWithRequest:withPriority:andResumeData:andCountOfBytesClientExpectsToReceive:", a3, 0, 0, NSURLSessionTransferSizeUnknown);
}

- (id)downloadTaskWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  double v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLQueuedNSURLRequest resumeData](self, "resumeData"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLQueuedNSURLRequest resumeData](self, "resumeData"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadTaskWithResumeData:", v6));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLQueuedNSURLRequest request](self, "request"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadTaskWithRequest:", v6));
  }
  v8 = (void *)v7;

  v9 = -[CLQueuedNSURLRequest priority](self, "priority");
  if (v9 <= 2)
  {
    LODWORD(v10) = *(_DWORD *)*(&off_100407018 + v9);
    objc_msgSend(v8, "setPriority:", v10);
  }
  objc_msgSend(v8, "setCountOfBytesClientExpectsToReceive:", -[CLQueuedNSURLRequest countOfBytesClientExpectsToReceive](self, "countOfBytesClientExpectsToReceive"));

  return v8;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CLQueuedNSURLRequest request](self, "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return v3;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSData)resumeData
{
  return self->_resumeData;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
