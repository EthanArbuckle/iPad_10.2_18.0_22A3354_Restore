@implementation ISStoreServicesRequestOperation

- (ISStoreServicesRequestOperation)initWithRequest:(id)a3
{
  ISStoreServicesRequestOperation *v5;
  objc_super v7;

  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid request"));
  v7.receiver = self;
  v7.super_class = (Class)ISStoreServicesRequestOperation;
  v5 = -[ISOperation init](&v7, sel_init);
  if (v5)
    v5->_request = (SSRequest *)a3;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISStoreServicesRequestOperation;
  -[ISStoreServicesRequestOperation dealloc](&v3, sel_dealloc);
}

- (SSRequest)request
{
  SSRequest *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_request;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)cancel
{
  objc_super v3;

  -[SSRequest cancel](-[ISStoreServicesRequestOperation request](self, "request"), "cancel");
  v3.receiver = self;
  v3.super_class = (Class)ISStoreServicesRequestOperation;
  -[ISOperation cancel](&v3, sel_cancel);
}

- (void)run
{
  NSObject *v3;
  SSRequest *request;
  _QWORD v5[6];

  v3 = dispatch_semaphore_create(0);
  request = self->_request;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__ISStoreServicesRequestOperation_run__block_invoke;
  v5[3] = &unk_24C43CDF0;
  v5[4] = self;
  v5[5] = v3;
  -[SSRequest startWithCompletionBlock:](request, "startWithCompletionBlock:", v5);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
}

intptr_t __38__ISStoreServicesRequestOperation_run__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setSuccess:", a2 != 0);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
