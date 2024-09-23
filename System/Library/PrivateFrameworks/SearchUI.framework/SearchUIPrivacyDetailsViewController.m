@implementation SearchUIPrivacyDetailsViewController

- (SearchUIPrivacyDetailsViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  SearchUIPrivacyDetailsViewController *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    v7 = CFSTR("com.apple.onboarding.translate");
  else
    v7 = CFSTR("com.apple.onboarding.sirisuggestions");
  v8 = -[SearchUIPrivacyDetailsViewController initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v7);

  return v8;
}

- (SearchUIPrivacyDetailsViewController)initWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  SearchUIPrivacyDetailsViewController *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v5 = (void *)getOBPrivacySplashControllerClass_softClass;
  v17 = getOBPrivacySplashControllerClass_softClass;
  if (!getOBPrivacySplashControllerClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getOBPrivacySplashControllerClass_block_invoke;
    v13[3] = &unk_1EA1F6930;
    v13[4] = &v14;
    __getOBPrivacySplashControllerClass_block_invoke((uint64_t)v13);
    v5 = (void *)v15[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v6, "splashPageWithBundleIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)SearchUIPrivacyDetailsViewController;
  v8 = -[SearchUIPrivacyDetailsViewController initWithRootViewController:](&v12, sel_initWithRootViewController_, v7);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v8, sel_dismiss);
    objc_msgSend(v7, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v9);

    -[SearchUIPrivacyDetailsViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
  }

  return v8;
}

- (void)dismiss
{
  -[SearchUIPrivacyDetailsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
