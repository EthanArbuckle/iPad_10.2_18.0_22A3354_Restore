@implementation TUIFeedSuspendLayoutUpdateCondition

- (BOOL)evaluateWithRenderModel:(id)a3
{
  TUIFeedSuspendLayoutUpdateCondition *v3;
  os_unfair_lock_s *p_lock;

  v3 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options(&self->super._lock, 0x10000);
  LOBYTE(v3) = *(_BYTE *)&v3->super._state & 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

@end
