@implementation AsyncFallbackPreparationQueue

void __AsyncFallbackPreparationQueue_block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.UIKit.UIImage.async-drawing");
  v1 = (void *)qword_1ECD79578;
  qword_1ECD79578 = (uint64_t)v0;

}

@end
