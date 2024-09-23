@implementation SearchUIMusicDisclosureCheckCache

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, void *);
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a4;
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SearchUIUtilities isAppInstalledWithBundleId:](SearchUIUtilities, "isAppInstalledWithBundleId:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DDC030], "sharedPrivacyInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "preflightDisclosureRequiredForMusic");
    v9 = v8 | objc_msgSend(v7, "privacyAcknowledgementRequiredForMusic");
    v10 = v9 ^ 1u;
    SearchUIGeneralLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("YES");
      if (v9)
        v12 = CFSTR("NO");
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1DAD39000, v11, OS_LOG_TYPE_DEFAULT, "Disclosure approved by user: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v13);

}

@end
