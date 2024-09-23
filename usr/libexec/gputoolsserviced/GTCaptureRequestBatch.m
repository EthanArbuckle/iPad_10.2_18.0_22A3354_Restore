@implementation GTCaptureRequestBatch

- (GTCaptureRequestBatch)init
{
  GTCaptureRequestBatch *v2;
  GTCaptureRequestBatch *v3;
  unsigned int v4;
  GTCaptureRequestBatch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTCaptureRequestBatch;
  v2 = -[GTCaptureRequestBatch init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    do
      v4 = __ldaxr((unsigned int *)&unk_10003D4F0);
    while (__stlxr(v4 + 1, (unsigned int *)&unk_10003D4F0));
    v2->_requestID = v4;
    v5 = v2;
  }

  return v3;
}

- (GTCaptureRequestBatch)initWithRequestID:(unint64_t)a3
{
  GTCaptureRequestBatch *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTCaptureRequestBatch;
  result = -[GTCaptureRequestBatch init](&v5, "init");
  if (result)
    result->_requestID = a3;
  return result;
}

- (GTCaptureRequestBatch)initWithCoder:(id)a3
{
  id v4;
  GTCaptureRequestBatch *v5;
  GTCaptureRequestBatch *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTCaptureRequestBatch;
  v5 = -[GTCaptureRequestBatch init](&v8, "init");
  if (v5)
  {
    v5->_requestID = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestID"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_requestID, CFSTR("requestID"));
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
