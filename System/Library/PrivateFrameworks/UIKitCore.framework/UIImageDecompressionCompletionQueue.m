@implementation UIImageDecompressionCompletionQueue

void ___UIImageDecompressionCompletionQueue_block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.UIKit.decompression-completed");
  v1 = (void *)qword_1ECD79530;
  qword_1ECD79530 = (uint64_t)v0;

}

@end
