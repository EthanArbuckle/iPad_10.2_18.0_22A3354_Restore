@implementation VUIRestrictions

- (BOOL)allowsShowingUndownloadedTVShows
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47178]);

  return v3 != 2;
}

- (BOOL)allowsShowingUndownloadedMovies
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47170]);

  return v3 != 2;
}

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_0 != -1)
    dispatch_once(&sharedInstance___onceToken_0, &__block_literal_global_22);
  return (id)sharedInstance___sharedInstance_2;
}

void __33__VUIRestrictions_sharedInstance__block_invoke()
{
  VUIRestrictions *v0;
  void *v1;

  v0 = objc_alloc_init(VUIRestrictions);
  v1 = (void *)sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v0;

}

- (BOOL)allowsExplicitContent
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FF8]);

  return v3 != 2;
}

@end
