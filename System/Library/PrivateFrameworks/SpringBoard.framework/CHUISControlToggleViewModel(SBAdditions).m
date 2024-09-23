@implementation CHUISControlToggleViewModel(SBAdditions)

- (id)sb_secondaryText
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  objc_msgSend(a1, "subtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = objc_msgSend(a1, "state");
    if ((v5 & 1) != 0)
      objc_msgSend(a1, "onOption");
    else
      objc_msgSend(a1, "offOption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v4 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v5)
        v11 = CFSTR("CONTROL_ON");
      else
        v11 = CFSTR("CONTROL_OFF");
      objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

- (id)sb_secondaryTextColor
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v2 = objc_msgSend(a1, "state");
  objc_msgSend(a1, "onOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  if (v2)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "sbui_inactiveColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)sb_actionHintTextWithType:()SBAdditions
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  v5 = objc_msgSend(a1, "state");
  if (v5)
    objc_msgSend(a1, "offOption");
  else
    objc_msgSend(a1, "onOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    *a3 = 1;
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      *a3 = 0;
      v9 = v10;
    }
    else
    {
      *a3 = 1;
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v5)
        v14 = CFSTR("TURN_OFF");
      else
        v14 = CFSTR("TURN_ON");
      objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

@end
