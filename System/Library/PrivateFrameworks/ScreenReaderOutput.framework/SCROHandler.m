@implementation SCROHandler

- (SCROHandler)init
{
  SCROHandler *v2;
  NSLock *v3;
  NSLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCROHandler;
  v2 = -[SCROHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v3;

  }
  return v2;
}

- (void)lock
{
  -[NSLock lock](self->_lock, "lock");
}

- (void)unlock
{
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)invalidate
{
  self->isInvalid = 1;
}

- (int)handleRegisterCallbackForKey:(int)a3 trusted:(BOOL)a4
{
  return 2;
}

- (int)handleSetValue:(id)a3 forKey:(int)a4 trusted:(BOOL)a5
{
  return 2;
}

- (int)handleGetValue:(id *)a3 forKey:(int)a4 trusted:(BOOL)a5
{
  return -[SCROHandler handleGetValue:forKey:withObject:trusted:](self, "handleGetValue:forKey:withObject:trusted:", a3, *(_QWORD *)&a4, 0, a5);
}

- (int)handleGetValue:(id *)a3 forKey:(int)a4 withObject:(id)a5 trusted:(BOOL)a6
{
  return 2;
}

- (int)handlePerformActionForKey:(int)a3 trusted:(BOOL)a4
{
  return 2;
}

- (id)callbackDelegate
{
  return objc_loadWeakRetained(&self->_callbackDelegate);
}

- (void)setCallbackDelegate:(id)a3
{
  objc_storeWeak(&self->_callbackDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_callbackDelegate);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
