@implementation OBPrivacyPresenter(PKPrivacy)

+ (id)pk_presenterForContext:()PKPrivacy
{
  void *v4;
  void *v5;
  void *v6;

  PKPrivacyBundleIdentifiersForContext(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "presenterForPrivacySplashWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "presenterForPrivacyUnifiedAboutWithIdentifiers:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (void)pk_defaultPresentationActionForContext:()PKPrivacy
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__OBPrivacyPresenter_PKPrivacy__pk_defaultPresentationActionForContext___block_invoke;
  v4[3] = &__block_descriptor_48_e26_v16__0__UIViewController_8l;
  v4[4] = a1;
  v4[5] = a3;
  return _Block_copy(v4);
}

@end
