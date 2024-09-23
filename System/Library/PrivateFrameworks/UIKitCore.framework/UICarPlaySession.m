@implementation UICarPlaySession

void __35___UICarPlaySession_sharedInstance__block_invoke()
{
  _UICarPlaySession *v0;
  void *v1;
  objc_super v2;

  v0 = [_UICarPlaySession alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)_UICarPlaySession;
    v0 = (_UICarPlaySession *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
      v0->_lock._os_unfair_lock_opaque = 0;
  }
  v1 = (void *)_MergedGlobals_1211;
  _MergedGlobals_1211 = (uint64_t)v0;

}

@end
