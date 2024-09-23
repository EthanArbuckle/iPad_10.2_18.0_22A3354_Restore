@implementation SBSApplicationShortcutSystemIcon

void __66__SBSApplicationShortcutSystemIcon_SBHAdditions__sbh_defaultImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3870];
  SBHBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("SBSApplicationShortcutSystemIcon_UnreadDot"), v3, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sbh_defaultImage___defaultImage;
  sbh_defaultImage___defaultImage = v1;

}

@end
