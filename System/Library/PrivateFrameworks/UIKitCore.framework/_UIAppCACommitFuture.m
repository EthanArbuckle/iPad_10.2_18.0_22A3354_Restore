@implementation _UIAppCACommitFuture

- (void)_invoke
{
  void (**block)(void);
  id v4;

  if (!self->_invalidated)
  {
    -[_UIAppCACommitFuture willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("finished"));
    block = (void (**)(void))self->_block;
    if (block)
    {
      block[2]();
      v4 = self->_block;
    }
    else
    {
      v4 = 0;
    }
    self->_finished = 1;
    self->_block = 0;

    -[_UIAppCACommitFuture didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("finished"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

+ (id)scheduledPreCommitFuture:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPhase:block:", 1, v4);

  return v5;
}

- (_UIAppCACommitFuture)initWithPhase:(unint64_t)a3 block:(id)a4
{
  id v6;
  _UIAppCACommitFuture *v7;
  uint64_t v8;
  id block;
  void *v10;
  id *v11;
  void *v12;
  _QWORD v14[4];
  _UIAppCACommitFuture *v15;
  _QWORD v16[4];
  _UIAppCACommitFuture *v17;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_UIAppCACommitFuture;
  v7 = -[_UIAppCACommitFuture init](&v18, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    block = v7->_block;
    v7->_block = (id)v8;

    *(_WORD *)&v7->_invalidated = 0;
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
      v12 = (void *)MEMORY[0x1E0CD28B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44___UIAppCACommitFuture_initWithPhase_block___block_invoke_2;
      v14[3] = &unk_1E16B1B28;
      v11 = (id *)&v15;
      v15 = v7;
      objc_msgSend(v12, "addCommitHandler:forPhase:", v14, 1);
      goto LABEL_6;
    }
    if (!a3)
    {
      v10 = (void *)UIApp;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __44___UIAppCACommitFuture_initWithPhase_block___block_invoke;
      v16[3] = &unk_1E16B1B28;
      v11 = (id *)&v17;
      v17 = v7;
      objc_msgSend(v10, "_performBlockAfterCATransactionCommits:", v16);
LABEL_6:

    }
  }

  return v7;
}

+ (id)scheduledPostCommitFuture:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPhase:block:", 0, v4);

  return v5;
}

- (void)invalidate
{
  id block;

  if (!self->_invalidated && !self->_finished)
  {
    -[_UIAppCACommitFuture willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("invalidated"));
    self->_invalidated = 1;
    block = self->_block;
    self->_block = 0;

    -[_UIAppCACommitFuture didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("invalidated"));
  }
}

- (BOOL)_isInvalidated
{
  return self->_invalidated;
}

- (BOOL)_isFinished
{
  return self->_finished;
}

@end
