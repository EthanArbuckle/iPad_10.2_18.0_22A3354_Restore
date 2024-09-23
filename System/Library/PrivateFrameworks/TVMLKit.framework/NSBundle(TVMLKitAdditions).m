@implementation NSBundle(TVMLKitAdditions)

- (id)tv_launchImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceIdiom:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("LaunchImage"), a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)tv_imageNamed:()TVMLKitAdditions
{
  return objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", a3, a1);
}

@end
