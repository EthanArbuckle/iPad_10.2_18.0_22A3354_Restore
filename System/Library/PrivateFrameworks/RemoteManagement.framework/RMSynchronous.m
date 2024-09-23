@implementation RMSynchronous

- (RMSynchronous)init
{
  RMSynchronous *v2;
  uint64_t v3;
  NSConditionLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RMSynchronous;
  v2 = -[RMSynchronous init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 1);
    lock = v2->_lock;
    v2->_lock = (NSConditionLock *)v3;

  }
  return v2;
}

- (void)complete
{
  -[NSConditionLock lock](self->_lock, "lock");
  -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", 0);
}

- (void)waitForCompletion
{
  -[NSConditionLock lockWhenCondition:](self->_lock, "lockWhenCondition:", 0);
  -[NSConditionLock unlock](self->_lock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
