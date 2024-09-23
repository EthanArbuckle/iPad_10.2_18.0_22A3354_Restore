@implementation PKMANotificationAuthorizationAssetManager

+ (id)sharedInstance
{
  if (_MergedGlobals_681 != -1)
    dispatch_once(&_MergedGlobals_681, &__block_literal_global_151);
  return (id)qword_1ED06C790;
}

void __59__PKMANotificationAuthorizationAssetManager_sharedInstance__block_invoke()
{
  PKMANotificationAuthorizationAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKMANotificationAuthorizationAssetManager);
  v1 = (void *)qword_1ED06C790;
  qword_1ED06C790 = (uint64_t)v0;

}

- (PKMANotificationAuthorizationAssetManager)init
{
  PKMANotificationAuthorizationAssetManager *v2;
  uint64_t v3;
  PKMobileAssetManager *mobileAssetManager;
  PKMANotificationAuthorizationAssetManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKMANotificationAuthorizationAssetManager;
  v2 = -[PKMANotificationAuthorizationAssetManager init](&v7, sel_init);
  if (v2
    && (objc_msgSend(MEMORY[0x1E0D66E70], "sharedInstance"),
        v3 = objc_claimAutoreleasedReturnValue(),
        mobileAssetManager = v2->_mobileAssetManager,
        v2->_mobileAssetManager = (PKMobileAssetManager *)v3,
        mobileAssetManager,
        !v2->_mobileAssetManager))
  {
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (id)notificationAuthorizationString:(id)a3
{
  NSString *v4;
  NSBundle *v5;
  void *v6;

  v4 = (NSString *)a3;
  -[PKMobileAssetManager cachedStringsBundleWithIdentifier:](self->_mobileAssetManager, "cachedStringsBundleWithIdentifier:", *MEMORY[0x1E0D6A5A0]);
  v5 = (NSBundle *)objc_claimAutoreleasedReturnValue();
  PKLocalizedStringInMobileAssetsStringsBundle(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    PKLocalizedString(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)downloadNotificationAuthorizationImage:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  PKMobileAssetManager *mobileAssetManager;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[PKMANotificationAuthorizationAssetManager _notificationAuthorizationImageFilenameForLocale:](self, "_notificationAuthorizationImageFilenameForLocale:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  mobileAssetManager = self->_mobileAssetManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__PKMANotificationAuthorizationAssetManager_downloadNotificationAuthorizationImage_completion___block_invoke;
  v10[3] = &unk_1E3E71AA8;
  v11 = v6;
  v9 = v6;
  -[PKMobileAssetManager dynamicAssetWithIdentifier:parameters:timeout:completion:](mobileAssetManager, "dynamicAssetWithIdentifier:parameters:timeout:completion:", v7, 0, 20, v10);

}

uint64_t __95__PKMANotificationAuthorizationAssetManager_downloadNotificationAuthorizationImage_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  return result;
}

- (CGImage)notificationAuthorizationImageForLocale:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  CGImage *v12;

  -[PKMANotificationAuthorizationAssetManager _notificationAuthorizationImageFilenameForLocale:](self, "_notificationAuthorizationImageFilenameForLocale:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMobileAssetManager cachedDynamicAssetWithIdentifier:parameters:](self->_mobileAssetManager, "cachedDynamicAssetWithIdentifier:parameters:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("_%@"), CFSTR("Light"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("_%@"), CFSTR("Dark"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v10 = 0;
LABEL_6:
    PKUIImageNamed(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_4;
LABEL_7:
    PKUIImageNamed(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v7, v5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
    goto LABEL_6;
  if (!v9)
    goto LABEL_7;
LABEL_4:
  PKUIDynamicImage(v8, v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (CGImage *)objc_msgSend(v11, "CGImage");

  return v12;
}

- (id)_notificationAuthorizationImageFilenameForLocale:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("Notification"));
  if ((PKIsVision() & 1) != 0)
  {
    v5 = CFSTR("Vision");
LABEL_13:
    objc_msgSend(v4, "appendFormat:", CFSTR("_%@"), v5);
    goto LABEL_14;
  }
  v6 = PKIsPad();
  v7 = CFSTR("Phone");
  if (v6)
    v7 = CFSTR("Pad");
  objc_msgSend(v4, "appendFormat:", CFSTR("_%@"), v7);
  v8 = PKLocaleIs24HourMode();
  v9 = CFSTR("12hr");
  if (v8)
    v9 = CFSTR("24hr");
  objc_msgSend(v4, "appendFormat:", CFSTR("_%@"), v9);
  v10 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v3, "languageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "characterDirectionForLanguage:", v11);

  v13 = CFSTR("LTR");
  if (v12 == 2)
    v13 = CFSTR("RTL");
  objc_msgSend(v4, "appendFormat:", CFSTR("_%@"), v13);
  v14 = PKNumberingSystemForLocale();
  if (v14 == 1)
  {
    v5 = CFSTR("Arabic");
    goto LABEL_13;
  }
  if (v14 == 2)
  {
    v5 = CFSTR("Devanagari");
    goto LABEL_13;
  }
LABEL_14:
  v15 = (void *)objc_msgSend(v4, "copy");

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetManager, 0);
}

@end
