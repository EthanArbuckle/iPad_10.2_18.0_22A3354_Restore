@implementation TUIFeedSuspendLayoutCondition

- (BOOL)evaluateWithEntry:(id)a3 index:(unint64_t)a4
{
  TUIFeedSuspendLayoutCondition *v4;
  os_unfair_lock_s *p_lock;

  v4 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options(&self->super._lock, 0x10000);
  LOBYTE(v4) = *(_BYTE *)&v4->super._state & 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v4;
}

@end
