@implementation PCPrefsQueue

void __PCPrefsQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("PC-Prefs-Queue", 0);
  v1 = (void *)PCPrefsQueue_prefsQueue;
  PCPrefsQueue_prefsQueue = (uint64_t)v0;

}

@end
