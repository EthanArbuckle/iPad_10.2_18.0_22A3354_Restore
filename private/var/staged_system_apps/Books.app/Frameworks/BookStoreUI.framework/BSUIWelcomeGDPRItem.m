@implementation BSUIWelcomeGDPRItem

- (BOOL)welcomeScreenShouldShow
{
  void *v2;
  unsigned int v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults bu_groupUserDefaults](NSUserDefaults, "bu_groupUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKNeverShowGDPRWelcomeScreen"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults bu_groupUserDefaults](NSUserDefaults, "bu_groupUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("BKAlwaysShowGDPRWelcomeScreen"));

  v6 = BUOnboardingBooksBundleID();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:](AMSAcknowledgePrivacyTask, "acknowledgementNeededForPrivacyIdentifier:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeStoreAccount"));

    if (v10)
    {
      if (qword_32BFD8 != -1)
        dispatch_once(&qword_32BFD8, &stru_2E4820);
    }
  }
  v11 = BSUIWelcomeScreenLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109888;
    v14[1] = (v5 | v8) & ~v3;
    v15 = 1024;
    v16 = v3;
    v17 = 1024;
    v18 = v5;
    v19 = 1024;
    v20 = v8;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRItem: welcomeScreenShouldShow: shouldShow: %d forceHide: %d forceShow: %d needsDisplay: %d", (uint8_t *)v14, 0x1Au);
  }

  return (v5 | v8) & ~(_BYTE)v3;
}

- (BOOL)welcomeScreenShouldDisplayNavigationBar
{
  return 0;
}

- (id)welcomeScreenViewControllerWithCompletion:(id)a3
{
  id v3;
  BSUIWelcomeGDPRViewController *v4;
  id v5;
  BSUIWelcomeGDPRViewController *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = [BSUIWelcomeGDPRViewController alloc];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1699C;
  v8[3] = &unk_2E3F88;
  v9 = v3;
  v5 = v3;
  v6 = -[BSUIWelcomeGDPRViewController initWithCompletion:](v4, "initWithCompletion:", v8);

  return v6;
}

- (void)welcomeScreenViewControllerDidDismiss
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc((Class)AMSAcknowledgePrivacyTask);
  v3 = BUOnboardingBooksBundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = objc_msgSend(v2, "initWithPrivacyIdentifier:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "acknowledgePrivacy"));
  objc_msgSend(v5, "addFinishBlock:", &stru_2E4880);

}

@end
