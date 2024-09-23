@implementation SBSApplicationShortcutIcon

void __63__SBSApplicationShortcutIcon_ShortcutUIKit___scui_defaultImage__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  ShortcutUIKitBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("UnreadDot"), v4, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithRenderingMode:", 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_scui_defaultImage___defaultImage;
  _scui_defaultImage___defaultImage = v2;

}

@end
