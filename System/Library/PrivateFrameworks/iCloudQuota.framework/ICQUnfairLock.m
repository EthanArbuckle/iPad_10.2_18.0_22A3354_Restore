@implementation ICQUnfairLock

- (void)synchronized:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(p_lock);
  if (v5)
    v5[2]();
  os_unfair_lock_unlock(p_lock);

}

- (ICQUnfairLock)init
{
  ICQUnfairLock *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICQUnfairLock;
  result = -[ICQUnfairLock init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

@end
