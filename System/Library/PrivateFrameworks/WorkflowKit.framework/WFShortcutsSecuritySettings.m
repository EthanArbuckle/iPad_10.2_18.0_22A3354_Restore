@implementation WFShortcutsSecuritySettings

+ (BOOL)areScriptingActionsEnabled
{
  void *v2;
  char v3;

  +[WFSecuredPreferences standardPreferences](WFSecuredPreferences, "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFScriptingActionEnabledKey"));

  return v3;
}

+ (id)scripingActionDisabledErrorWithActionName:(id)a3
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
    WFLocalizedString(CFSTR("“%@” Can’t Be Run"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("Action Cannot Be Run"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v3, "length"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This shortcut cannot be run because “%@” is a scripting action and your Shortcuts security settings don’t allow you to run scripting actions."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("This shortcut cannot be run because this action is a scripting action and your Shortcuts security settings don’t allow you to run scripting actions."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D68];
  v15[0] = *MEMORY[0x1E0CB2D50];
  v15[1] = v11;
  v16[0] = v6;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 12, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)allowsSharingLargeAmountsOfData
{
  void *v2;
  char v3;

  +[WFSecuredPreferences standardPreferences](WFSecuredPreferences, "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFAllowSharingLargeAmountsOfDataKey"));

  return v3;
}

+ (BOOL)allowsDeletingWithoutConfirmation
{
  void *v2;
  char v3;

  +[WFSecuredPreferences standardPreferences](WFSecuredPreferences, "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFAllowDeletingWithoutConfirmationKey"));

  return v3;
}

+ (BOOL)allowsDeletingLargeAmountsOfData
{
  void *v2;
  char v3;

  +[WFSecuredPreferences standardPreferences](WFSecuredPreferences, "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFAllowDeletingLargeAmountsOfDataKey"));

  return v3;
}

@end
