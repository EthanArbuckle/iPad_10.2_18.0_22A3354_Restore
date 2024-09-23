@implementation KTCondition

- (KTCondition)init
{
  return (KTCondition *)-[KTCondition initToChain:](self, "initToChain:", 0);
}

- (id)initToChain:(id)a3
{
  id v5;
  KTCondition *v6;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *semaphore;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTCondition;
  v6 = -[KTCondition init](&v10, "init");
  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    semaphore = v6->_semaphore;
    v6->_semaphore = (OS_dispatch_semaphore *)v7;

    objc_storeStrong((id *)&v6->_chain, a3);
  }

  return v6;
}

- (void)fulfill
{
  NSObject *v3;
  void *v4;

  v3 = objc_claimAutoreleasedReturnValue(-[KTCondition semaphore](self, "semaphore"));
  dispatch_semaphore_signal(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTCondition chain](self, "chain"));
  objc_msgSend(v4, "fulfill");

  -[KTCondition setChain:](self, "setChain:", 0);
}

- (int64_t)wait:(int64_t)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  NSObject *v8;

  v5 = objc_claimAutoreleasedReturnValue(-[KTCondition semaphore](self, "semaphore"));
  v6 = dispatch_time(0, a3);
  v7 = dispatch_semaphore_wait(v5, v6);

  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[KTCondition semaphore](self, "semaphore"));
    dispatch_semaphore_signal(v8);

  }
  return v7;
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (KTCondition)chain
{
  return (KTCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chain, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end
