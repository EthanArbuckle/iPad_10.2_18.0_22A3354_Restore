@implementation _HKSPUnfairLock

- (_HKSPUnfairLock)init
{
  _HKSPUnfairLock *v2;
  _HKSPUnfairLock *v3;
  _HKSPUnfairLock *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKSPUnfairLock;
  v2 = -[_HKSPUnfairLock init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)performBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)performBlockAssertingLocked:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(void);

  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_assert_owner(p_lock);
  v4[2]();

}

@end
