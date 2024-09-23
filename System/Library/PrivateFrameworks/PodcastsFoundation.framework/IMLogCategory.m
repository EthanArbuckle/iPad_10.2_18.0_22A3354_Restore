@implementation IMLogCategory

+ (OS_os_log)player
{
  if (player_onceToken != -1)
    dispatch_once(&player_onceToken, &__block_literal_global_6_0);
  return (OS_os_log *)(id)player_IMLogCategoryPlayer;
}

void __23__IMLogCategory_player__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.podcasts.imframeworks", "Player");
  v1 = (void *)player_IMLogCategoryPlayer;
  player_IMLogCategoryPlayer = (uint64_t)v0;

}

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1)
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global_12);
  return (OS_os_log *)(id)defaultCategory_IMLogCategoryDefault;
}

void __32__IMLogCategory_defaultCategory__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.podcasts.imframeworks", "Podcasts");
  v1 = (void *)defaultCategory_IMLogCategoryDefault;
  defaultCategory_IMLogCategoryDefault = (uint64_t)v0;

}

+ (OS_os_log)accessibility
{
  if (accessibility_onceToken != -1)
    dispatch_once(&accessibility_onceToken, &__block_literal_global_2);
  return (OS_os_log *)(id)accessibility_IMLogCategoryAccessibility;
}

void __30__IMLogCategory_accessibility__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.podcasts.imframeworks", "Accessibility");
  v1 = (void *)accessibility_IMLogCategoryAccessibility;
  accessibility_IMLogCategoryAccessibility = (uint64_t)v0;

}

+ (OS_os_log)imageCache
{
  if (imageCache_onceToken != -1)
    dispatch_once(&imageCache_onceToken, &__block_literal_global_4);
  return (OS_os_log *)(id)imageCache_IMLogCategoryImageCache;
}

void __27__IMLogCategory_imageCache__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.podcasts.imframeworks", "ImageCache");
  v1 = (void *)imageCache_IMLogCategoryImageCache;
  imageCache_IMLogCategoryImageCache = (uint64_t)v0;

}

@end
