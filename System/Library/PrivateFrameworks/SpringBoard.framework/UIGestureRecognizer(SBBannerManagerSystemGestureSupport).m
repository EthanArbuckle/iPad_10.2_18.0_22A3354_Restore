@implementation UIGestureRecognizer(SBBannerManagerSystemGestureSupport)

- (uint64_t)sb_isInstalledAsSystemGesture
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, "com.apple.SpringBoardFramework.bannerManager.systemGestureStatus");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)sb_setInstalledAsSystemGesture:()SBBannerManagerSystemGestureSupport
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "com.apple.SpringBoardFramework.bannerManager.systemGestureStatus", v2, (void *)3);

}

@end
