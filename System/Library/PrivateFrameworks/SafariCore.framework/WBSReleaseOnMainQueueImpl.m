@implementation WBSReleaseOnMainQueueImpl

void __WBSReleaseOnMainQueueImpl_block_invoke()
{
  os_unfair_lock_lock((os_unfair_lock_t)&WBSReleaseOnMainQueueImpl_lock);
  objc_msgSend((id)WBSReleaseOnMainQueueImpl_objectList, "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)&WBSReleaseOnMainQueueImpl_lock);
}

@end
