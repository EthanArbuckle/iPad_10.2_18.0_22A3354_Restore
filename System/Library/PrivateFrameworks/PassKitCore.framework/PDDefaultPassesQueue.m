@implementation PDDefaultPassesQueue

void __PDDefaultPassesQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.passd.preferences.defaultPasses", 0);
  v1 = (void *)qword_1ECF22940;
  qword_1ECF22940 = (uint64_t)v0;

}

@end
