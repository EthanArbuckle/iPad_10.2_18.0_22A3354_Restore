@implementation NSBundle

void __40__NSBundle_VideosUI__vui_videosUIBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.VideosUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vui_videosUIBundle_bundle;
  vui_videosUIBundle_bundle = v0;

}

@end
