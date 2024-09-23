@implementation PDSQueueProxy

- (PDSQueueProxy)initWithTarget:(id)a3 queue:(id)a4 mode:(unint64_t)a5
{
  id v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemonRemoteVendor.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (!self)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemonRemoteVendor.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

  if (!v12)
    goto LABEL_7;
LABEL_3:
  if (self)
  {
LABEL_4:
    objc_storeStrong(&self->_target, a3);
    objc_storeStrong((id *)&self->_queue, a4);
    self->_mode = a5;
  }
LABEL_5:

  return self;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PDSQueueProxy target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", v4);

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  char v4;

  -[PDSQueueProxy target](self, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  -[PDSQueueProxy target](self, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "methodSignatureForSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  PDSQueueProxy *v11;
  _QWORD block[4];
  id v13;
  PDSQueueProxy *v14;

  v4 = a3;
  v5 = -[PDSQueueProxy mode](self, "mode");
  if (!v5)
  {
    -[PDSQueueProxy queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __35__PDSQueueProxy_forwardInvocation___block_invoke_2;
    v9[3] = &unk_24D4A6F78;
    v10 = v4;
    v11 = self;
    dispatch_sync(v8, v9);

    v7 = v10;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    objc_msgSend(v4, "retainArguments");
    -[PDSQueueProxy queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__PDSQueueProxy_forwardInvocation___block_invoke;
    block[3] = &unk_24D4A6F78;
    v13 = v4;
    v14 = self;
    dispatch_async(v6, block);

    v7 = v13;
LABEL_5:

  }
}

void __35__PDSQueueProxy_forwardInvocation___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "target");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invokeWithTarget:", v2);

}

void __35__PDSQueueProxy_forwardInvocation___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "target");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invokeWithTarget:", v2);

}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
