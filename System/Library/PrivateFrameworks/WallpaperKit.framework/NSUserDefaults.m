@implementation NSUserDefaults

id __58__NSUserDefaults_WKAdditions__wk_wallpaperKitUserDefaults__block_invoke()
{
  if (WKIgnoreLogicalScreenClassForWallpaperBundleKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&WKIgnoreLogicalScreenClassForWallpaperBundleKey_block_invoke_na_once_token_0, &__block_literal_global_7);
  return (id)WKIgnoreLogicalScreenClassForWallpaperBundleKey_block_invoke_na_once_object_0;
}

void __58__NSUserDefaults_WKAdditions__wk_wallpaperKitUserDefaults__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WallpaperKit"));
  v1 = (void *)WKIgnoreLogicalScreenClassForWallpaperBundleKey_block_invoke_na_once_object_0;
  WKIgnoreLogicalScreenClassForWallpaperBundleKey_block_invoke_na_once_object_0 = v0;

}

@end
