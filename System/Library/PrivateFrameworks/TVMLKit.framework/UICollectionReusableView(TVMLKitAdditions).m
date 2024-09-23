@implementation UICollectionReusableView(TVMLKitAdditions)

- (uint64_t)tv_setBelongsToOldIndexPath:()TVMLKitAdditions
{
  void *v5;

  objc_msgSend(a1, "willChangeValueForKey:", CFSTR("tv_belongsToOldIndexPath"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "tv_belongsToOldIndexPath", v5, (void *)1);

  return objc_msgSend(a1, "didChangeValueForKey:", CFSTR("tv_belongsToOldIndexPath"));
}

- (uint64_t)tv_belongsToOldIndexPath
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, "tv_belongsToOldIndexPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)tv_setDisplayed:()TVMLKitAdditions
{
  void *v5;

  objc_msgSend(a1, "willChangeValueForKey:", CFSTR("tv_displayed"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "tv_displayed", v5, (void *)1);

  return objc_msgSend(a1, "didChangeValueForKey:", CFSTR("tv_displayed"));
}

- (uint64_t)tv_isDisplayed
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, "tv_displayed");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)tv_setFocused:()TVMLKitAdditions
{
  void *v5;

  objc_msgSend(a1, "willChangeValueForKey:", CFSTR("tv_focused"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "tv_focused", v5, (void *)1);

  return objc_msgSend(a1, "didChangeValueForKey:", CFSTR("tv_focused"));
}

- (uint64_t)tv_isFocused
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, "tv_focused");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

@end
