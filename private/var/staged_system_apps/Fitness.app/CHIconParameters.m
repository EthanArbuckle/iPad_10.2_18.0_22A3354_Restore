@implementation CHIconParameters

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)preferredAppStoreIconWidth
{
  return self->_preferredAppStoreIconWidth;
}

- (void)setPreferredAppStoreIconWidth:(double)a3
{
  self->_preferredAppStoreIconWidth = a3;
}

- (BOOL)needsWatchIcon
{
  return self->_needsWatchIcon;
}

- (void)setNeedsWatchIcon:(BOOL)a3
{
  self->_needsWatchIcon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
