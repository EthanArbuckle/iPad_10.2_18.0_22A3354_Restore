@implementation WallpaperItemListManager

- (void)preferencesDidChange
{
  uint64_t v3;
  int IsFeaturedContentAllowed;
  int v5;

  v3 = sub_1A7ADBF34();
  IsFeaturedContentAllowed = PXPreferencesIsFeaturedContentAllowed(v3);
  v5 = self->isFeaturedContentAllowed[0];
  self->isFeaturedContentAllowed[0] = IsFeaturedContentAllowed;
  if (IsFeaturedContentAllowed != v5)
    sub_1A6B18B14();
  swift_release();
}

@end
