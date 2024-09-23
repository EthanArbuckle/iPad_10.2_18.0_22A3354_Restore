@implementation PGUnfairLock

- (PGUnfairLock)init
{
  PGUnfairLock *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGUnfairLock;
  result = -[PGUnfairLock init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

@end
