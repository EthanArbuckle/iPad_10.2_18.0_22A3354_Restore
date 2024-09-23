@implementation _UIAfterCACommitBlock

- (BOOL)run
{
  id block;
  void *v5;
  id v6;
  void *v8;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAfterCACommitQueue.m"), 127, CFSTR("Call must be made on main thread"));

  }
  block = self->_block;
  if (block)
  {
    v5 = (void *)MEMORY[0x186DC9484]();
    (*((void (**)(void))self->_block + 2))();
    v6 = self->_block;
    self->_block = 0;

    objc_autoreleasePoolPop(v5);
  }
  return block != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_next, 0);
}

- (unsigned)_initWithBlock:(unsigned __int8 *)a1
{
  id v3;
  unsigned __int8 *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_UIAfterCACommitBlock;
    v4 = (unsigned __int8 *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v4;
    if (v4)
    {
      v5 = (void *)*((_QWORD *)v4 + 1);
      *((_QWORD *)v4 + 1) = 0;

      v6 = objc_msgSend(v3, "copy");
      v7 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v6;

      atomic_store(0, a1 + 24);
    }
  }

  return a1;
}

+ (id)blockWithBlock:(id)a3
{
  id v3;
  unsigned __int8 *v4;

  v3 = a3;
  v4 = -[_UIAfterCACommitBlock _initWithBlock:]((unsigned __int8 *)[_UIAfterCACommitBlock alloc], v3);

  return v4;
}

@end
