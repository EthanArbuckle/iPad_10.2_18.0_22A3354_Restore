@implementation PUActivityItemSourceOperation

- (PUActivityItemSourceOperation)initWithDelegate:(id)a3 activityType:(id)a4
{
  id v6;
  id v7;
  PUActivityItemSourceOperation *v8;
  PUActivityItemSourceOperation *v9;
  uint64_t v10;
  NSString *activityType;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *semaphore;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUActivityItemSourceOperation;
  v8 = -[PUActivityItemSourceOperation init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_msgSend(v7, "copy");
    activityType = v9->_activityType;
    v9->_activityType = (NSString *)v10;

    v12 = dispatch_semaphore_create(0);
    semaphore = v9->_semaphore;
    v9->_semaphore = (OS_dispatch_semaphore *)v12;

  }
  return v9;
}

- (void)main
{
  void *v3;
  id v4;

  -[PUActivityItemSourceOperation delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUActivityItemSourceOperation activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityItemSourceOperation:prepareItemForActivityType:", self, v3);

}

- (void)pu_cancel
{
  -[PUActivityItemSourceOperation _pu_setCancelled:](self, "_pu_setCancelled:", 1);
}

- (PUActivityItemSourceOperationDelegate)delegate
{
  return (PUActivityItemSourceOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (BOOL)_pu_isCancelled
{
  return self->__pu_cancelled;
}

- (void)_pu_setCancelled:(BOOL)a3
{
  self->__pu_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
