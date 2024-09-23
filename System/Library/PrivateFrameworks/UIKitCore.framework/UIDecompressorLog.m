@implementation UIDecompressorLog

void __UIDecompressorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "Decompressor");
  v1 = (void *)qword_1ECD79E38;
  qword_1ECD79E38 = (uint64_t)v0;

}

@end
