@implementation PKAsyncUnaryOperationComposer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
}

- (void)addOperation:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *operations;
  void *v7;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    operations = self->_operations;
    v7 = _Block_copy(v5);

    -[NSMutableArray addObject:](operations, "addObject:", v7);
    os_unfair_lock_unlock(p_lock);
  }
}

- (PKAsyncUnaryOperationComposer)init
{
  PKAsyncUnaryOperationComposer *v2;
  PKAsyncUnaryOperationComposer *v3;
  NSMutableArray *v4;
  NSMutableArray *operations;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAsyncUnaryOperationComposer;
  v2 = -[PKAsyncUnaryOperationComposer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    operations = v3->_operations;
    v3->_operations = v4;

  }
  return v3;
}

- (id)evaluateWithInput:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PKAsyncUnaryOperationComposer evaluatorWithInput:](self, "evaluatorWithInput:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evaluateWithCompletion:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)evaluatorWithInput:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)-[NSMutableArray copy](self->_operations, "copy");
  os_unfair_lock_unlock(p_lock);
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("PKAsyncUnaryOperationComposer: cannot compose operations with nil initial input."));
  v7 = -[PKAsyncUnaryOperationEvaluator _initWithOperations:input:]([PKAsyncUnaryOperationEvaluator alloc], "_initWithOperations:input:", v6, v5);

  return v7;
}

@end
