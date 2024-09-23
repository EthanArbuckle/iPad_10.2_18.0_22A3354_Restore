@implementation ICUnfairLock

- (ICUnfairLock)init
{
  ICUnfairLock *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICUnfairLock;
  result = -[ICUnfairLock init](&v3, sel_init);
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

- (ICUnfairLock)lockWithBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);
  ICUnfairLock *result;

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
  return result;
}

@end
