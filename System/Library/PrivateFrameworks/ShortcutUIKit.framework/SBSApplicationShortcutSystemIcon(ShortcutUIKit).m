@implementation SBSApplicationShortcutSystemIcon(ShortcutUIKit)

- (id)_scui_iconImageWithAssetProvider:()ShortcutUIKit
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "systemImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_3;
  v3 = (void *)MEMORY[0x24BDF6AE0];
  objc_msgSend(MEMORY[0x24BDF6A70], "defaultFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  objc_msgSend(v3, "configurationWithPointSize:weight:scale:", 4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_3:
    objc_msgSend(a1, "_scui_iconImageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDF6AC8];
      ShortcutUIKitBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "imageWithRenderingMode:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (const)_scui_iconImageName
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "type");
  if (v1 > 0x1C)
    return CFSTR("UnreadDot");
  else
    return *(&off_24D37ECF8 + v1);
}

@end
