@implementation PKTimeProfileQueue

void __PKTimeProfileQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PassKit.timeprofile", 0);
  v1 = (void *)qword_1ECF220B0;
  qword_1ECF220B0 = (uint64_t)v0;

}

@end
