@implementation SKCompletionHandler

- (SKCompletionHandler)initWithCompletionBlock:(id)a3 progressBlock:(id)a4 function:(const char *)a5
{
  id v8;
  id v9;
  SKCompletionHandler *v10;
  void *v11;
  id completionBlock;
  void *v13;
  id progressBlock;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SKCompletionHandler;
  v10 = -[SKCompletionHandler init](&v16, sel_init);
  if (v10)
  {
    v11 = _Block_copy(v8);
    completionBlock = v10->_completionBlock;
    v10->_completionBlock = v11;

    v13 = _Block_copy(v9);
    progressBlock = v10->_progressBlock;
    v10->_progressBlock = v13;

    v10->_functionName = a5;
  }

  return v10;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (id)errorBlock
{
  return self->_errorBlock;
}

- (void)setErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_semaphore, a3);
}

- (const)functionName
{
  return self->_functionName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
