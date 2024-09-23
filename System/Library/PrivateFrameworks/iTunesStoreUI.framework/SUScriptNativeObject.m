@implementation SUScriptNativeObject

- (SUScriptNativeObject)init
{
  SUScriptNativeObject *v2;
  NSLock *v3;
  NSLock *internalLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptNativeObject;
  v2 = -[SUScriptNativeObject init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    internalLock = v2->_internalLock;
    v2->_internalLock = v3;

  }
  return v2;
}

- (id)object
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SUScriptNativeObject weakObject](self, "weakObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SUScriptNativeObject strongObject](self, "strongObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (SUScriptObject)scriptObject
{
  id WeakRetained;

  -[SUScriptNativeObject lock](self, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->_scriptObject);
  -[SUScriptNativeObject unlock](self, "unlock");
  return (SUScriptObject *)WeakRetained;
}

- (void)setObject:(id)a3
{
  void *v4;
  id strongObject;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[SUScriptNativeObject object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SUScriptNativeObject destroyNativeObject](self, "destroyNativeObject");
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "clearsWeakScriptReferences") & 1) != 0)
  {
    -[SUScriptNativeObject lock](self, "lock");
    strongObject = self->_strongObject;
    self->_strongObject = 0;
    v6 = v8;
  }
  else
  {
    -[SUScriptNativeObject lock](self, "lock");
    v7 = v8;
    v6 = 0;
    strongObject = self->_strongObject;
    self->_strongObject = v7;
  }

  objc_storeWeak(&self->_weakObject, v6);
  -[SUScriptNativeObject unlock](self, "unlock");
  -[SUScriptNativeObject setupNativeObject](self, "setupNativeObject");

}

- (void)setScriptObject:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v4 = a3;
  -[SUScriptNativeObject lock](self, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->_scriptObject);

  objc_storeWeak((id *)&self->_scriptObject, v4);
  -[SUScriptNativeObject unlock](self, "unlock");
  if (!v4)
  {
    if (WeakRetained)
    {
      -[SUScriptNativeObject mainThreadProxy](self, "mainThreadProxy");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "destroyNativeObject");

    }
  }
}

- (void)setStrongObject:(id)a3
{
  id v4;
  void *v5;
  id strongObject;

  v4 = a3;
  -[SUScriptNativeObject object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[SUScriptNativeObject destroyNativeObject](self, "destroyNativeObject");
  -[SUScriptNativeObject lock](self, "lock");
  strongObject = self->_strongObject;
  self->_strongObject = v4;

  if (v4)
    objc_storeWeak(&self->_weakObject, 0);
  -[SUScriptNativeObject unlock](self, "unlock");
  -[SUScriptNativeObject setupNativeObject](self, "setupNativeObject");
}

- (void)setWeakObject:(id)a3
{
  id v4;
  void *v5;
  id strongObject;

  v4 = a3;
  -[SUScriptNativeObject object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[SUScriptNativeObject destroyNativeObject](self, "destroyNativeObject");
  -[SUScriptNativeObject lock](self, "lock");
  objc_storeWeak(&self->_weakObject, v4);

  if (v4)
  {
    strongObject = self->_strongObject;
    self->_strongObject = 0;

  }
  -[SUScriptNativeObject unlock](self, "unlock");
  -[SUScriptNativeObject setupNativeObject](self, "setupNativeObject");
}

- (id)strongObject
{
  id v3;

  -[SUScriptNativeObject lock](self, "lock");
  v3 = self->_strongObject;
  -[SUScriptNativeObject unlock](self, "unlock");
  return v3;
}

- (id)weakObject
{
  id WeakRetained;

  -[SUScriptNativeObject lock](self, "lock");
  WeakRetained = objc_loadWeakRetained(&self->_weakObject);
  -[SUScriptNativeObject unlock](self, "unlock");
  return WeakRetained;
}

- (void)destroyNativeObject
{
  id strongObject;

  -[SUScriptNativeObject lock](self, "lock");
  objc_storeWeak(&self->_weakObject, 0);
  strongObject = self->_strongObject;
  self->_strongObject = 0;

  -[SUScriptNativeObject unlock](self, "unlock");
}

- (void)lock
{
  id v2;

  -[SUScriptNativeObject internalLock](self, "internalLock");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

}

+ (SUScriptNativeObject)objectWithNativeObject:(id)a3
{
  return (SUScriptNativeObject *)objc_msgSend(a1, "objectWithNativeObject:weak:", a3, 0);
}

+ (SUScriptNativeObject)objectWithNativeObject:(id)a3 weak:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "setWeakObject:", v6);
  else
    objc_msgSend(v7, "setStrongObject:", v6);

  return (SUScriptNativeObject *)v8;
}

- (void)unlock
{
  id v2;

  -[SUScriptNativeObject internalLock](self, "internalLock");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unlock");

}

- (NSLock)internalLock
{
  return self->_internalLock;
}

- (void)setInternalLock:(id)a3
{
  objc_storeStrong((id *)&self->_internalLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalLock, 0);
  objc_destroyWeak((id *)&self->_scriptObject);
  objc_destroyWeak(&self->_weakObject);
  objc_storeStrong(&self->_strongObject, 0);
}

@end
