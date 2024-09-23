@implementation _PXAsyncIterator

- (_PXAsyncIterator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAsyncIterator.m"), 33, CFSTR("%s is not available as initializer"), "-[_PXAsyncIterator init]");

  abort();
}

- (_PXAsyncIterator)initWithCount:(unint64_t)a3 handler:(id)a4
{
  id v6;
  _PXAsyncIterator *v7;
  _PXAsyncIterator *v8;
  void *v9;
  id handler;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXAsyncIterator;
  v7 = -[_PXAsyncIterator init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_count = a3;
    v9 = _Block_copy(v6);
    handler = v8->_handler;
    v8->_handler = v9;

  }
  return v8;
}

- (void)_executeNextRun
{
  void (**v3)(id, _PXAsyncIterator *);

  if (self->_index >= self->_count)
  {
    -[_PXAsyncIterator stop](self, "stop");
  }
  else
  {
    -[_PXAsyncIterator handler](self, "handler");
    v3 = (void (**)(id, _PXAsyncIterator *))objc_claimAutoreleasedReturnValue();
    v3[2](v3, self);

  }
}

- (void)next
{
  if (!-[_PXAsyncIterator hasStopped](self, "hasStopped"))
  {
    ++self->_index;
    -[_PXAsyncIterator _executeNextRun](self, "_executeNextRun");
  }
}

- (void)stop
{
  void (**v3)(void);
  void (**v4)(void);

  -[_PXAsyncIterator setHasStopped:](self, "setHasStopped:", 1);
  self->_index = 0;
  -[_PXAsyncIterator completion](self, "completion");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v3[2]();
    -[_PXAsyncIterator setCompletion:](self, "setCompletion:", 0);
    v3 = v4;
  }

}

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)handler
{
  return self->_handler;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)hasStopped
{
  return self->_hasStopped;
}

- (void)setHasStopped:(BOOL)a3
{
  self->_hasStopped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
