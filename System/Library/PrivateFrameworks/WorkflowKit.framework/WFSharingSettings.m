@implementation WFSharingSettings

+ (BOOL)sharingEnabled
{
  return 1;
}

+ (BOOL)shortcutFileSharingEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFShortcutsFileSharingEnabled"));

  return v3;
}

+ (id)sharingDisabledAlertWithWorkflowName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D13DE0];
  objc_msgSend(a1, "sharingDisabledAlertWithShortcutName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharingDisabledAlertWithShortcutName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("“%@” Can’t Be Opened"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("Shortcut Cannot Be Opened"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  WFLocalizedString(CFSTR("This shortcut cannot be opened because your Shortcuts security settings don’t allow untrusted shortcuts."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D68];
  v13[0] = *MEMORY[0x1E0CB2D50];
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WFShortcutSharingErrorDomain"), 2, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)shortcutFileSharingDisabledAlert
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13DE0];
  objc_msgSend(a1, "shortcutFileSharingDisabledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)shortcutFileSharingDisabledError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v8[0] = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("Importing unsigned shortcut files is not supported. Please use another sharing option."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E0CB2D68];
  WFLocalizedString(CFSTR("Shortcut Cannot Be Opened"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFShortcutSharingErrorDomain"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isPrivateSharingEnabled
{
  void *v2;
  char v3;

  +[WFSecuredPreferences standardPreferences](WFSecuredPreferences, "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFShortcutsPrivateSharingEnabled"));

  return v3;
}

+ (id)privateSharingDisabledErrorWithShortcutName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("“%@” Can’t Be Imported"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("Shortcut Cannot Be Imported"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v3, "length"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("The shortcut “%@” was received from someone you know, but it cannot be opened because Private Sharing is disabled in your Shortcuts settings."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("This shortcut was received from someone you may know, but it cannot be opened because Private Sharing is disabled in your Shortcuts settings."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D68];
  v15[0] = *MEMORY[0x1E0CB2D50];
  v15[1] = v11;
  v16[0] = v9;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WFShortcutSharingErrorDomain"), 2, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)privateSharingDisabledAlertWithShortcutName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D13DE0];
  objc_msgSend(a1, "privateSharingDisabledErrorWithShortcutName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
