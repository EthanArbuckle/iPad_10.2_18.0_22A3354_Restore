@implementation PBUIRegisterForWallpaperExternalChangeNotification

uint64_t __PBUIRegisterForWallpaperExternalChangeNotification_block_invoke()
{
  return notify_register_dispatch("com.apple.springboard.wallpaperchanged", (int *)&PBUIRegisterForWallpaperExternalChangeNotification___token, MEMORY[0x1E0C80D38], &__block_literal_global_112);
}

void __PBUIRegisterForWallpaperExternalChangeNotification_block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SBFWallpaperDidChangeNotification"), 0);

}

@end
