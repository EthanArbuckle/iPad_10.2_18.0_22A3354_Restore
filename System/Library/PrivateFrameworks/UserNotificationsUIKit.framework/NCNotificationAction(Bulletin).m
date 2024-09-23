@implementation NCNotificationAction(Bulletin)

+ (id)notificationActionForAction:()Bulletin bulletin:observer:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_notificationActionForAction:bulletin:observer:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

+ (id)notificationActionForDefaultAction:()Bulletin bulletin:observer:
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a1, "_notificationActionForAction:bulletin:observer:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIdentifier:", *MEMORY[0x1E0CEC808]);
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)notificationActionForDismissAction:()Bulletin bulletin:observer:
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a1, "_notificationActionForAction:bulletin:observer:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", *MEMORY[0x1E0CEC818]);
  objc_msgSend(v9, "setActivationMode:", 0);
  if (v8)
    v10 = objc_msgSend(v8, "shouldDismissBulletin");
  else
    v10 = 1;
  objc_msgSend(v9, "setShouldDismissNotification:", v10);
  v11 = (void *)objc_msgSend(v9, "copy");

  return v11;
}

+ (id)notificationActionForSilenceAction:()Bulletin bulletin:observer:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_notificationActionForAction:bulletin:observer:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", *MEMORY[0x1E0CEC828]);
  objc_msgSend(v1, "setActivationMode:", 0);
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

+ (id)notificationActionForFollowActivityAction:()Bulletin bulletin:observer:
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a1, "_notificationActionForAction:bulletin:observer:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)_notificationActionForAction:()Bulletin bulletin:observer:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NCBulletinActionRunner *v25;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "appearance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0DC5FB8]);
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", v12);

  objc_msgSend(v10, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v13);

  v14 = objc_msgSend(v7, "activationMode");
  if (v14 == 1)
    v15 = 2;
  else
    v15 = v14 == 0;
  objc_msgSend(v11, "setActivationMode:", v15);
  objc_msgSend(v11, "setRequiresAuthentication:", objc_msgSend(v7, "isAuthenticationRequired"));
  objc_msgSend(v7, "launchURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLaunchURL:", v16);

  objc_msgSend(v7, "launchBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLaunchBundleID:", v17);

  objc_msgSend(v11, "setBehavior:", objc_msgSend(v7, "behavior") == 1);
  objc_msgSend(v7, "behaviorParameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBehaviorParameters:", v18);

  if (v7)
  {
    objc_msgSend(v7, "appearance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDestructiveAction:", objc_msgSend(v19, "style") == 1);

  }
  else
  {
    objc_msgSend(v11, "setDestructiveAction:", 0);
  }
  objc_msgSend(v11, "setShouldDismissNotification:", objc_msgSend(v7, "shouldDismissBulletin"));
  objc_msgSend(v10, "image");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIconImageName:", v21);

  objc_msgSend(v20, "bundlePath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIconImageBundlePath:", v22);

  v23 = (void *)MEMORY[0x1E0DC5FF0];
  objc_msgSend(v9, "contentType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsSiriActionCandidate:", objc_msgSend(v23, "isSiriActionCandidate:contentType:", v9, v24));

  v25 = -[NCBulletinActionRunner initWithAction:bulletin:observer:]([NCBulletinActionRunner alloc], "initWithAction:bulletin:observer:", v7, v9, v8);
  objc_msgSend(v11, "setActionRunner:", v25);

  return v11;
}

+ (uint64_t)isSiriActionCandidate:()Bulletin contentType:
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D03640]) & 1) != 0)
      v8 = 0;
    else
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D03638]) ^ 1;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intentIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "containsObject:", v11))
    {
      objc_msgSend(v5, "intentIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", v13);

      v17 = v16 ^ 1;
    }
    else
    {
      v17 = 1;
    }

    v9 = (v8 | v17) ^ 1u;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)notificationActionForUNNotificationAction:()Bulletin bulletin:observer:
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NCBulletinActionRunner *v33;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  id v38;
  void *v39;

  v7 = a3;
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0DC5FB8];
  v38 = a5;
  v10 = objc_alloc_init(v9);
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v11);

  objc_msgSend(v7, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v12);

  v35 = objc_msgSend(v7, "options") & 4;
  if (v35)
    v13 = 1;
  else
    v13 = 2;
  objc_msgSend(v10, "setActivationMode:", v13, v35);
  v14 = objc_msgSend(v7, "options");
  objc_msgSend(v10, "setRequiresAuthentication:", v14 & 1);
  objc_opt_class();
  v15 = objc_opt_isKindOfClass() & 1;
  objc_msgSend(v10, "setBehavior:", v15);
  v16 = objc_msgSend(v7, "options");
  v17 = v16;
  objc_msgSend(v10, "setDestructiveAction:", (v16 >> 1) & 1);
  v18 = objc_msgSend(v7, "options");
  v19 = v18;
  objc_msgSend(v10, "setShouldDismissNotification:", (*(_QWORD *)&v18 & 0x10000) == 0);
  objc_msgSend(v7, "icon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIconImageName:", v21);

  v39 = v8;
  if ((objc_msgSend(v20, "isSystemIcon") & 1) != 0)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(v8, "sectionBundlePath");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = v14 & 1;
  v37 = (void *)v22;
  objc_msgSend(v10, "setIconImageBundlePath:", v22);
  v24 = (void *)MEMORY[0x1E0D03698];
  objc_msgSend(v7, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "actionWithIdentifier:title:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setActionType:", 7);
  objc_msgSend(v27, "setActivationMode:", (v36 >> 2) ^ 1);
  objc_msgSend(v27, "setAuthenticationRequired:", v23);
  objc_msgSend(v27, "setBehavior:", v15);
  objc_msgSend(v27, "setShouldDismissBulletin:", (*(_QWORD *)&v19 & 0x10000) == 0);
  if ((v17 & 2) != 0)
  {
    objc_msgSend(v27, "appearance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setStyle:", 1);

  }
  if (v20)
  {
    objc_msgSend(v27, "appearance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0D036B0];
    objc_msgSend(v20, "imageName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "imageWithName:inBundlePath:", v31, v37);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setImage:", v32);

  }
  v33 = -[NCBulletinActionRunner initWithAction:bulletin:observer:]([NCBulletinActionRunner alloc], "initWithAction:bulletin:observer:", v27, v39, v38);

  objc_msgSend(v10, "setActionRunner:", v33);
  return v10;
}

+ (id)userNotificationActionForNCNotificationAction:()Bulletin
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E8D21F60;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v3, "activationMode");
  objc_msgSend(v3, "requiresAuthentication");
  objc_msgSend(v3, "isDestructiveAction");
  objc_msgSend(v3, "iconImageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v3, "iconImageBundlePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_msgSend(MEMORY[0x1E0CEC710], "iconWithTemplateImageName:", v9);
    else
      objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v3, "behavior") == 1)
  {
    objc_msgSend(v3, "behaviorParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CEC7D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "behaviorParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CEC7D8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEC780], "actionWithIdentifier:title:options:icon:textInputButtonTitle:textInputPlaceholder:", v4, v8, 0, v11, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC700], "actionWithIdentifier:title:options:icon:", v4, v8, 0, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

@end
