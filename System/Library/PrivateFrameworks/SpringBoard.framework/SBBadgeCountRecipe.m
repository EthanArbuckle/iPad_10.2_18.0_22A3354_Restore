@implementation SBBadgeCountRecipe

- (id)title
{
  return CFSTR("Badge count");
}

- (void)handleVolumeIncrease
{
  ++self->_badgeCount;
  -[SBBadgeCountRecipe _changeBadge:](self, "_changeBadge:");
}

- (void)handleVolumeDecrease
{
  unint64_t badgeCount;

  badgeCount = self->_badgeCount;
  if (badgeCount)
    self->_badgeCount = badgeCount - 1;
  -[SBBadgeCountRecipe _changeBadge:](self, "_changeBadge:");
}

- (void)_changeBadge:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", CFSTR("com.apple.Test"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBadgeValue:", v5);

  }
}

@end
