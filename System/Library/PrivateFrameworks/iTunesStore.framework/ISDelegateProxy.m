@implementation ISDelegateProxy

- (ISDelegateProxy)init
{
  ISDelegateProxy *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISDelegateProxy;
  v2 = -[ISDelegateProxy init](&v4, sel_init);
  if (v2)
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_lock = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISDelegateProxy;
  -[ISDelegateProxy dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  -[NSLock lock](self->_lock, "lock");
  self->_delegate = a3;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)sendInvocationToDelegate:(id)a3
{
  id v5;
  ISDelegateProxy *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;

  -[NSLock lock](self->_lock, "lock");
  v5 = self->_delegate;
  -[NSLock unlock](self->_lock, "unlock");
  v6 = self;
  v7 = (void *)objc_msgSend(a3, "methodSignature");
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v7);
  v9 = objc_msgSend(v7, "numberOfArguments");
  if (v9 >= 3)
  {
    v10 = v9;
    for (i = 2; i != v10; ++i)
    {
      v12 = 0;
      objc_msgSend(a3, "getArgument:atIndex:", &v12, i);
      objc_msgSend(v8, "setArgument:atIndex:", &v12, i);
    }
  }
  objc_msgSend(v8, "setSelector:", objc_msgSend(a3, "selector"));
  objc_msgSend(v8, "invokeWithTarget:", v5);

}

- (void)setShouldMessageMainThread:(BOOL)a3
{
  -[NSLock lock](self->_lock, "lock");
  self->_shouldMessageMainThread = a3;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)forwardInvocation:(id)a3
{
  _BOOL4 shouldMessageMainThread;

  -[NSLock lock](self->_lock, "lock");
  shouldMessageMainThread = self->_shouldMessageMainThread;
  -[NSLock unlock](self->_lock, "unlock");
  if (shouldMessageMainThread)
  {
    objc_msgSend(a3, "retainArguments");
    -[ISDelegateProxy performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_sendInvocationToDelegate_, a3, 0);
  }
  else
  {
    -[ISDelegateProxy sendInvocationToDelegate:](self, "sendInvocationToDelegate:", a3);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISDelegateProxy;
  v5 = -[ISDelegateProxy methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!v5)
  {
    -[NSLock lock](self->_lock, "lock");
    v5 = (id)objc_msgSend(self->_delegate, "methodSignatureForSelector:", a3);
    -[NSLock unlock](self->_lock, "unlock");
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;

  -[NSLock lock](self->_lock, "lock");
  v4 = objc_opt_respondsToSelector();
  -[NSLock unlock](self->_lock, "unlock");
  return v4 & 1;
}

@end
