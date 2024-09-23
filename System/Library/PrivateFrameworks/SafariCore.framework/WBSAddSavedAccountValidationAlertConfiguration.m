@implementation WBSAddSavedAccountValidationAlertConfiguration

+ (id)alertTitleForFailedAccountCreationWithErrorCode:(int64_t)a3
{
  __CFString *v3;

  if ((unint64_t)(a3 - 2) >= 3)
  {
    if (a3 == 1)
      v3 = CFSTR("Incomplete Website Address");
    else
      v3 = CFSTR("Cannot Add Password");
  }
  else
  {
    v3 = CFSTR("Password Already Exists");
  }
  _WBSLocalizedString(v3, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)alertSubtitleForFailedAccountCreationWithErrorCode:(int64_t)a3 forUserTypedSite:(id)a4 userTypedUsername:(id)a5 highLevelDomain:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  switch(a3)
  {
    case 1:
      v16 = CFSTR("Add a complete website address to allow this password to AutoFill in Safari and other apps.");
      goto LABEL_9;
    case 2:
      v17 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString(CFSTR("A password for “%@” on “%@” already exists."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v14, v11, v10);
      goto LABEL_6;
    case 3:
    case 4:
      v13 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString(CFSTR("A password for “%@” on “%@” already exists."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v14, v11, v12);
LABEL_6:
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    case 5:
      v16 = CFSTR("To save a password, you need to provide either a website, app name, or label.");
      goto LABEL_9;
    case 6:
      v16 = CFSTR("Cannot add password to this group.");
LABEL_9:
      _WBSLocalizedString(v16, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v15 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(a1, "alertUnknownErrorStringForFailedAccountCreation");
      v15 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v18 = (void *)v15;
LABEL_11:

  return v18;
}

+ (NSString)alertDismissActionTitleForFailedAccountCreation
{
  return (NSString *)_WBSLocalizedString(CFSTR("OK"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

+ (NSString)alertUnknownErrorStringForFailedAccountCreation
{
  return (NSString *)_WBSLocalizedString(CFSTR("An Error Occurred."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

@end
