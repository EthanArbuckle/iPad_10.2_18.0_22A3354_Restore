@implementation RCUnfairLock

- (void)unlock
{
  os_unfair_lock_unlock(&self->_unfairLock);
}

- (void)performWithLockSync:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[RCUnfairLock lock](self, "lock");
  v4[2](v4);

  -[RCUnfairLock unlock](self, "unlock");
}

- (void)lock
{
  os_unfair_lock_lock_with_options();
}

- (RCUnfairLock)init
{
  return -[RCUnfairLock initWithOptions:](self, "initWithOptions:", 0);
}

- (RCUnfairLock)initWithOptions:(int64_t)a3
{
  char v3;
  RCUnfairLock *result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)RCUnfairLock;
  result = -[RCUnfairLock init](&v5, sel_init);
  if (result)
  {
    result->_unfairLock._os_unfair_lock_opaque = 0;
    if ((v3 & 1) != 0)
      result->_unfairLockOptions |= 0x10000u;
  }
  return result;
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

- (unsigned)unfairLockOptions
{
  return self->_unfairLockOptions;
}

- (void)setUnfairLockOptions:(unsigned int)a3
{
  self->_unfairLockOptions = a3;
}

@end
