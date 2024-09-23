@implementation TLOperation

+ (unint64_t)relativePriority
{
  return 0;
}

- (TLOperation)init
{
  TLOperation *v2;
  objc_super v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TLOperation;
  v2 = -[TLOperation init](&v8, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __19__TLOperation_init__block_invoke;
    v5[3] = &unk_24CE30E48;
    objc_copyWeak(&v6, &location);
    v4.receiver = v2;
    v4.super_class = (Class)TLOperation;
    -[TLOperation setCompletionBlock:](&v4, sel_setCompletionBlock_, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __19__TLOperation_init__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TLOperationDomain"), 400, &unk_24CE33818);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v2;
  }
  objc_msgSend(WeakRetained, "operationCompletionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "operationCompletionBlock");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v4)[2](v4, WeakRetained, v1);

  }
  objc_msgSend(WeakRetained, "setOperationCompletionBlock:", 0);

}

- (TLTimelineDataSource)dataSource
{
  return (TLTimelineDataSource *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (id)operationCompletionBlock
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setOperationCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_operationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
