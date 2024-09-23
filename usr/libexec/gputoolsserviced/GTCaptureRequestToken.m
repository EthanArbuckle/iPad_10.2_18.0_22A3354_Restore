@implementation GTCaptureRequestToken

- (GTCaptureRequestToken)initWithCaptureService:(id)a3 andTokenId:(unint64_t)a4
{
  id v7;
  GTCaptureRequestToken *v8;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *finished;
  GTCaptureRequestToken *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTCaptureRequestToken;
  v8 = -[GTCaptureRequestToken init](&v13, "init");
  if (v8)
  {
    v9 = dispatch_semaphore_create(0);
    finished = v8->_finished;
    v8->_finished = (OS_dispatch_semaphore *)v9;

    v8->_tokenId = a4;
    objc_storeStrong((id *)&v8->_service, a3);
    v11 = v8;
  }

  return v8;
}

- (id)description
{
  GTCaptureRequestToken *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTCaptureRequestToken;
  v2 = -[GTCaptureRequestToken self](&v6, "self");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v3));

  return v4;
}

- (void)completed
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_finished);
}

- (void)waitUntilCompleted
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_finished, 0xFFFFFFFFFFFFFFFFLL);
}

- (unint64_t)tokenId
{
  return self->_tokenId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_finished, 0);
}

@end
