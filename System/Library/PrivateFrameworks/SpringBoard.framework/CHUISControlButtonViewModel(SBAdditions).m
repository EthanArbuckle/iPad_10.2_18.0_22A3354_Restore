@implementation CHUISControlButtonViewModel(SBAdditions)

- (id)sb_secondaryTextColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a1, "tint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  if (objc_msgSend(a1, "isAnimating"))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)sb_keyColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "tint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  if ((objc_msgSend(a1, "isAnimating") & 1) != 0 || objc_msgSend(a1, "isLauncher"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)sb_actionHintTextWithType:()SBAdditions
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "actionHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    *a3 = 1;
    v7 = v5;
LABEL_6:
    v9 = v7;
    goto LABEL_7;
  }
  if (!objc_msgSend(a1, "isLauncher"))
  {
    *a3 = 0;
    objc_msgSend(a1, "title");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  *a3 = 1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONTROL_OPEN"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

@end
