@implementation RAPPrivacy

+ (void)performPrivacyCheckWithAppearance:(int64_t)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  if (objc_msgSend(a1, "hasReceivedPrivacyConsent"))
  {
    if (v6)
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v6 + 2))(v6, 1, 0, 0);
  }
  else
  {
    objc_msgSend(a1, "showPrivacyScreenWithAppearance:completion:", a3, v6);
  }

}

+ (void)performPrivacyCheckWithAppearance:(int64_t)a3 userEnteredEmailAddress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;

  v9 = a4;
  v8 = a5;
  if (objc_msgSend(a1, "hasReceivedPrivacyConsent"))
  {
    if (v8)
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v8 + 2))(v8, 1, 0, 0);
  }
  else
  {
    objc_msgSend(a1, "showPrivacyScreenWithAppearance:userEnteredEmailAddress:completion:", a3, v9, v8);
  }

}

+ (void)showPrivacyScreenWithAppearance:(int64_t)a3
{
  objc_msgSend(a1, "showPrivacyScreenWithAppearance:completion:", a3, 0);
}

+ (void)showPrivacyScreenWithAppearance:(int64_t)a3 userEnteredEmailAddress:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  RAPPrivacyViewController *v8;

  v6 = a5;
  v7 = a4;
  v8 = -[RAPPrivacyViewController initWithUserEnteredEmailAddress:]([RAPPrivacyViewController alloc], "initWithUserEnteredEmailAddress:", v7);

  -[RAPPrivacyViewController presentPrivacyScreen:](v8, "presentPrivacyScreen:", v6);
}

+ (void)showPrivacyScreenWithAppearance:(int64_t)a3 completion:(id)a4
{
  id v4;
  RAPPrivacyViewController *v5;

  v4 = a4;
  v5 = objc_alloc_init(RAPPrivacyViewController);
  -[RAPPrivacyViewController presentPrivacyScreen:](v5, "presentPrivacyScreen:", v4);

}

+ (BOOL)hasReceivedPrivacyConsent
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("RAPHasReceived2015PrivacyConsent"));

  return v3;
}

+ (void)setPrivacyConsent:(BOOL)a3 allowEmail:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setBool:forKey:", v5, CFSTR("RAPHasReceived2015PrivacyConsent"));

  if (v4)
    v7 = 1;
  else
    v7 = 2;
  sub_1004345C4(CFSTR("RAPContactBackByEmailPreference"), v7);
}

+ (id)callToActionMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Report an Issue [Call to action]"), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)callToActionMessageForShortcutType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Submit RAP Confirmation (Work Question)");
  }
  else if (a3 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Submit RAP Confirmation (Home Question)");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Submit RAP Confirmation (Default Question)");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

+ (id)informationalMessageWithEmailAddress:(id)a3 isUserEnteredEmailAddress:(BOOL)a4 isMac:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = v9;
  if (v8)
  {
    if (v6)
    {
      v11 = CFSTR("Report an Issue [Privacy description w/ user entered email]");
    }
    else if (v5)
    {
      v11 = CFSTR("Report an Issue Mac [Privacy description w/ email]");
    }
    else
    {
      v11 = CFSTR("Report an Issue [Privacy description w/ email]");
    }
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, CFSTR("localized string not found"), 0));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v7));
    v10 = (void *)v13;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Report an Issue [Privacy description w/o email]"), CFSTR("localized string not found"), 0));
  }

  return v12;
}

+ (id)macPreferencesInformationalMessageWithEmailAddress:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v4)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Report an Issue Preferences Mac [Privacy description w/ email]"), CFSTR("localized string not found"), 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v3));
    v6 = (void *)v7;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Report an Issue [Privacy description w/o email]"), CFSTR("localized string not found"), 0));
  }

  return v8;
}

+ (id)emailAnalyticsEventForEmailAddress:(id)a3 isValidEmail:(BOOL)a4 optedIn:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  __CFString *v9;

  if (a4)
  {
    if (a5)
      return CFSTR("EMAIL_ON");
    else
      return CFSTR("EMAIL_OFF");
  }
  else
  {
    v8 = objc_msgSend(a3, "length", v5, v6);
    v9 = CFSTR("INVALID_EMAIL");
    if (!v8)
      v9 = CFSTR("NO_EMAIL");
    return v9;
  }
}

@end
