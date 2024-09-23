@implementation PSITable

- (PSITable)initWithDelegate:(id)a3 searchable:(BOOL)a4 writable:(BOOL)a5
{
  id v6;
  PSITable *v7;
  PSITable *v8;
  objc_super v10;

  v6 = a3;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)PSITable;
    v7 = -[PSITable init](&v10, sel_init);
    v8 = v7;
    if (v7)
      objc_storeWeak((id *)&v7->_delegate, v6);
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_finalizzeWasCalled)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSITable.m"), 31, CFSTR("finalizze not called before word embedding table deallocation"));

  }
  v5.receiver = self;
  v5.super_class = (Class)PSITable;
  -[PSITable dealloc](&v5, sel_dealloc);
}

- (void)finalizze
{
  void *v4;

  if (self->_finalizzeWasCalled)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSITable.m"), 35, CFSTR("finalizze called multiple times"));

  }
  self->_finalizzeWasCalled = 1;
}

- (PSITableDelegate)delegate
{
  return (PSITableDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
